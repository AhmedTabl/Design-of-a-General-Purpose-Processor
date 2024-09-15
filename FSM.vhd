LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FSM IS
 PORT (clk : IN STD_LOGIC; -- Clock signal
		data_in : IN STD_LOGIC; -- Previous input
		reset : IN STD_LOGIC; -- Reset signal
		student_id : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Student id as a vector
		current_state: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- Current state on a vector
END FSM;


	-- THIS IS A MOORE FSM 
	
	-- MEALY FSM IS ON OTHER VHD FILE
	


ARCHITECTURE Behavior OF FSM IS

	TYPE state_type IS (s0, s1, s2, s3, s4, s5, s6, s7, s8); -- 9 state variables
	
	SIGNAL yfsm : state_type; -- Gives yfsm the option to be one of the s variables
	
BEGIN
	PROCESS (clk, reset) -- runs whenever the clock or reset signal is changed
	BEGIN
		IF reset = '1' THEN -- If the reset signal is on
			yfsm <= s0; -- Set the current state to the first state
		ELSIF (clk'EVENT AND clk = '1') THEN 
		-- Runs whenever the clock signal is changed, and it equals to 1 ( Rising Edge )
			CASE yfsm IS  -- Whatever the value of yfsm is, it sets the next state
			-- Pattern is s0 -> s1 -> s3 -> s5 -> s7 -> s8 -> s6 -> s4 -> s2 -> s0 -> repeat       
				WHEN s0 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s1; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s0; -- Keeps state on same state
					END IF;
				WHEN s1 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s2; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s1; -- Keeps state on same state
					END IF;
				WHEN s2 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s3; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s2; -- Keeps state on same state
					END IF;
				WHEN s3 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s4; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s3; -- Keeps state on same state
					END IF;
				WHEN s4 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s5; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s4; -- Keeps state on same state
					END IF;
				WHEN s5 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s6; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s5; -- Keeps state on same state
					END IF;
				WHEN s6 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s7; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s6; -- Keeps state on same state
					END IF;
				WHEN s7 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s8; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s7; -- Keeps state on same state
					END IF;
				WHEN s8 =>
					IF data_in = '1' THEN -- Only proceeds to next state if input is 1
						yfsm <= s0; -- Sets state to next state following pattern
					ELSE -- Stays on current state if input is 0
						yfsm <= s8; -- Keeps state on same state
					END IF;
			END CASE;
		END IF;
	END PROCESS;

	PROCESS (yfsm) -- Runs whenever yfsm is changed
	BEGIN	
		CASE yfsm IS
			WHEN s0 => -- When yfsm is at state 0
				current_state <= "0000"; -- Sets current state to the current state vector (s0)
				student_id <= "0101"; -- Sets student id to the value at the current state (5)
			WHEN s1 => -- When yfsm is at state 1
				current_state <= "0001"; -- Sets current state to the current state vector (s1)
				student_id <= "0000"; -- Sets student id to the value at the current state (0)
			WHEN s2 => -- When yfsm is at state 2
				current_state <= "0010"; -- Sets current state to the current state vector (s2)
				student_id <= "0001"; -- Sets student id to the value at the current state (1)
			WHEN s3 => -- When yfsm is at state 3
				current_state <= "0011"; -- Sets current state to the current state vector (s3)
				student_id <= "0001"; -- Sets student id to the value at the current state (1)
			WHEN s4 => -- When yfsm is at state 4
				current_state <= "0100"; -- Sets current state to the current state vector (s4)
				student_id <= "0110"; -- Sets student id to the value at the current state (8)
			WHEN s5 => -- When yfsm is at state 5
				current_state <= "0101"; -- Sets current state to the current state vector (s5)
				student_id <= "1001"; -- Sets student id to the value at the current state (1)
			WHEN s6 => -- When yfsm is at state 6
				current_state <= "0110"; -- Sets current state to the current state vector (s6)
				student_id <= "1001"; -- Sets student id to the value at the current state (2)
			WHEN s7 => -- When yfsm is at state 7
				current_state <= "0111"; -- Sets current state to the current state vector (s7)
				student_id <= "0100"; -- Sets student id to the value at the current state (5)
			WHEN s8 => -- When yfsm is at state 8
				current_state <= "1000"; -- Sets current state to the current state vector (s8)
				student_id <= "0011"; -- 10000011Sets student id to the value at the current state (0)
			WHEN OTHERS => -- When yfsm is at one of the invalid states
				current_state <= "1110"; -- Sets current state to ERROR (E)
				student_id <= "1110"; -- Sets student id to ERROR (E)
		END CASE;
	END PROCESS;	
END Behavior;