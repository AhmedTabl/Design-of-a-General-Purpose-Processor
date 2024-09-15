LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ModifiedALUCore IS
	PORT( Clock : IN STD_LOGIC;
			A,B : IN UNSIGNED(7 DOWNTO 0);
			student_id : IN UNSIGNED(3 DOWNTO 0);
			OP : IN UNSIGNED(15 DOWNTO 0);
			Neg : OUT STD_LOGIC;
			R1 : OUT UNSIGNED(3 DOWNTO 0);
			R2 : OUT UNSIGNED(3 DOWNTO 0));
END ModifiedALUCore;

ARCHITECTURE Calculation OF ModifiedALUCore IS
	SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0):= (OTHERS => '0');
	SIGNAL Reg4 : UNSIGNED(7 DOWNTO 0);
BEGIN
	Reg1 <= A;
	Reg2 <= B;
	PROCESS(Clock, OP)
	BEGIN	
		IF(RISING_EDGE(Clock)) THEN
		Neg <= '0';
			CASE OP IS
				WHEN "0000000000000001" =>
					IF A <= "00000000" THEN 
						Result <= "00000000";
					ELSE
						Result <= Reg1 + "00000010";
					END IF;
					-- Increment A by 2
				WHEN "0000000000000010" =>
					Result <= "00" & Reg2(7 DOWNTO 2);
					-- Bit shift B R2. in 0
				WHEN "0000000000000100" =>
					Result <= "1111" & Reg1(7 DOWNTO 4);
					-- Bit shift A R4. in 1
				WHEN "0000000000001000" =>
					IF A > B THEN
						Result <= B;
					ELSE 
						Result <= A;
					END IF;
					-- Min(A,B)
				WHEN "0000000000010000" =>
					Result <= Reg1(1 DOWNTO 0) & Reg1(7 DOWNTO 2);
					-- Rotate A R2
				WHEN "0000000000100000" =>
					Result <= Reg2(0) & Reg2(1) & Reg2(2) & Reg2(3) & Reg2(4) & Reg2(5) & Reg2(6) & Reg2(7);
					-- Reverse B
				WHEN "0000000001000000" =>
					Result <= Reg1 XOR Reg2;
					-- XOR
				WHEN "0000000010000000" =>
					Result <= Reg1 + Reg2 - "00000100";
					-- Sum + 4
				WHEN "0000000100000000" =>
					Result <= "11111111";
					-- High bits
				WHEN OTHERS =>
					--NOTHING
			END CASE;
		END IF;
	END PROCESS;
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);
END Calculation;