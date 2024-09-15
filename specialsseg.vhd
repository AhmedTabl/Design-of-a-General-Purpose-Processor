LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY specialsseg IS
	PORT( bcd : IN STD_LOGIC;
	leds : OUT STD_LOGIC_VECTOR(1 TO 7));
END specialsseg;

ARCHITECTURE Behavior OF specialsseg IS
BEGIN 
	PROCESS(bcd)
	BEGIN
		IF bcd = '1' THEN
			leds <= "0111011";
		ELSE 
			leds <= "0010101";
		END IF;
	END PROCESS;
END Behavior;