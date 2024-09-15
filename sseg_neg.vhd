LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg_neg IS
	PORT( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	neg : IN STD_LOGIC;
	leds : OUT STD_LOGIC_VECTOR(1 TO 7);
	signleds : OUT STD_LOGIC_VECTOR(1 TO 7));
END sseg_neg;

ARCHITECTURE Behavior OF sseg_neg IS
BEGIN 
	PROCESS(bcd)
	BEGIN	
		IF neg = '1' THEN
			signleds <= "0000001";
		ELSE
			signleds <= "0000000";
		END IF;
		CASE bcd IS
			WHEN "0000" => leds <= "1111110";
			WHEN "0001" => leds <= "0110000";
			WHEN "0010" => leds <= "1101101";
			WHEN "0011" => leds <= "1111001";
			WHEN "0100" => leds <= "0110011";
			WHEN "0101" => leds <= "1011011";
			WHEN "0110" => leds <= "1011111";
			WHEN "0111" => leds <= "1110000";
			WHEN "1000" => leds <= "1111111";
			WHEN "1001" => leds <= "1110011";
			WHEN "1010" => leds <= "1110111";
			WHEN "1011" => leds <= "0011111";
			WHEN "1100" => leds <= "1001110";
			WHEN "1101" => leds <= "0111101";
			WHEN "1110" => leds <= "1001111";
			WHEN "1111" => leds <= "1000111";
			WHEN OTHERS => leds <= "-------";
		END CASE;
	END PROCESS;
END Behavior;