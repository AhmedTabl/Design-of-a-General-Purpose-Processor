LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_4 IS
	PORT( Clock : IN STD_LOGIC;
			A,B : IN UNSIGNED(7 DOWNTO 0);
			student_id : IN UNSIGNED(3 DOWNTO 0);
			OP : IN UNSIGNED(15 DOWNTO 0);
			Neg : OUT STD_LOGIC;
			R1 : OUT UNSIGNED(3 DOWNTO 0);
			R2 : OUT UNSIGNED(3 DOWNTO 0));
END ALU_4;

ARCHITECTURE Calculation OF ALU_4 IS
	SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0):= (OTHERS => '0');
	SIGNAL Reg4 : UNSIGNED(0 TO 7);
BEGIN
	Reg1 <= A;
	Reg2 <= B;
	PROCESS(Clock, OP)
	BEGIN	
		IF(RISING_EDGE(Clock)) THEN
		Neg <= '0';
			CASE OP IS
				WHEN "0000000000000001" =>
					Result <= Reg1 + Reg2;
				WHEN "0000000000000010" =>
					Result <= Reg1 - Reg2;
					IF Reg1 < Reg2 THEN
						Neg <= '1';
					END IF;
					--SUB
				WHEN "0000000000000100" =>
					Result <= NOT Reg1;
					--INVERSE
				WHEN "0000000000001000" =>
					Result <= Reg1 NAND Reg2;
					--NAND
				WHEN "0000000000010000" =>
					Result <= Reg1 NOR Reg2;
					--NOR
				WHEN "0000000000100000" =>
					Result <= Reg1 AND Reg2;
					--AND
				WHEN "0000000001000000" =>
					Result <= Reg1 XOR Reg2;
					--OR
				WHEN "0000000010000000" =>
					Result <= Reg1 OR Reg2;
					--XOR
				WHEN "0000000100000000" =>
					Result <= Reg1 XNOR Reg2;
					--XNOR
				WHEN OTHERS =>
					--NOTHING
			END CASE;
		END IF;
	END PROCESS;
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);
END Calculation;