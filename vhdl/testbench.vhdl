library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_Level_tb is
    --
end Top_Level_tb;

architecture Behavioral of Top_Level_tb is
    component Top_Level
        Port (
            Buzz1, Buzz2, Buzz3, Buzz4, Buzz5, Buzz6, MasterReset : in STD_LOGIC;
            Ind1, Ind2, Ind3, Ind4, Ind5, Ind6 : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the DUT
    signal Buzz1, Buzz2, Buzz3, Buzz4, Buzz5, Buzz6, MasterReset : STD_LOGIC := '1'; -- Default high (inactive)
    signal Ind1, Ind2, Ind3, Ind4, Ind5, Ind6 : STD_LOGIC;
    
    -- Test Signals
    signal test_case_pulse : STD_LOGIC := '0';

begin
    -- Instantiate the DUT
    DUT: Top_Level
        Port map (
            Buzz1 => Buzz1,
            Buzz2 => Buzz2,
            Buzz3 => Buzz3,
            Buzz4 => Buzz4,
            Buzz5 => Buzz5,
            Buzz6 => Buzz6,
            MasterReset => MasterReset,
            Ind1 => Ind1,
            Ind2 => Ind2,
            Ind3 => Ind3,
            Ind4 => Ind4,
            Ind5 => Ind5,
            Ind6 => Ind6
        );

    stim_proc: process
    begin
        -- Initialize Inputs
        wait for 10 ns;

	    -- Test Case 1: Verify Master Reset
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        MasterReset <= '0';     -- Press Master Reset
        wait for 10 ns;
        MasterReset <= '1';     -- Release Master Reset
        wait for 10 ns;
        wait for 50 ns;

	    -- Test Case 2: Verify Buzz in on 1 
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 1
    	Buzz1 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz2 <= '0';
    	Buzz3 <= '0';
    	Buzz4 <= '0';
    	Buzz5 <= '0';
    	Buzz6 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz1 <= '1';
    	wait for 10 ns;
    	Buzz2 <= '1';
    	Buzz3 <= '1';
    	Buzz4 <= '1';
    	Buzz5 <= '1';
    	Buzz6 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 3: Verify Buzz in on 2
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 2
    	Buzz2 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz1 <= '0';
    	Buzz3 <= '0';
    	Buzz4 <= '0';
    	Buzz5 <= '0';
    	Buzz6 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz2 <= '1';
    	wait for 10 ns;
    	Buzz1 <= '1';
    	Buzz3 <= '1';
    	Buzz4 <= '1';
    	Buzz5 <= '1';
    	Buzz6 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 4: Verify Buzz in on 3
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 3
    	Buzz3 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz1 <= '0';
    	Buzz2 <= '0';
    	Buzz4 <= '0';
    	Buzz5 <= '0';
    	Buzz6 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz3 <= '1';
    	wait for 10 ns;
    	Buzz1 <= '1';
    	Buzz2 <= '1';
    	Buzz4 <= '1';
    	Buzz5 <= '1';
    	Buzz6 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 5: Verify Buzz in on 4 
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 4
    	Buzz4 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz1 <= '0';
    	Buzz2 <= '0';
    	Buzz3 <= '0';
    	Buzz5 <= '0';
    	Buzz6 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz4 <= '1';
    	wait for 10 ns;
    	Buzz1 <= '1';
    	Buzz2 <= '1';
    	Buzz3 <= '1';
    	Buzz5 <= '1';
    	Buzz6 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 6: Verify Buzz in on 5
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 5
    	Buzz5 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz1 <= '0';
    	Buzz2 <= '0';
    	Buzz3 <= '0';
    	Buzz4 <= '0';
    	Buzz6 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz5 <= '1';
    	wait for 10 ns;
    	Buzz1 <= '1';
    	Buzz2 <= '1';
    	Buzz3 <= '1';
    	Buzz4 <= '1';
    	Buzz6 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 7: Verify Buzz in on 6
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        -- Press Buzzer 6
    	Buzz6 <= '0'; 
    	wait for 10 ns;
        -- Press all other Buzzers
    	Buzz1 <= '0';
    	Buzz2 <= '0';
    	Buzz3 <= '0';
    	Buzz4 <= '0';
    	Buzz5 <= '0';
    	wait for 10 ns;
        -- Release Button
    	Buzz6 <= '1';
    	wait for 10 ns;
    	Buzz1 <= '1';
    	Buzz2 <= '1';
    	Buzz3 <= '1';
    	Buzz4 <= '1';
    	Buzz5 <= '1';
        wait for 10 ns;
        -- Reset
    	MasterReset <= '0';
    	wait for 10 ns;
    	MasterReset <= '1';
    	wait for 50 ns;

	    -- Test Case 8: Reset During Buzz
        test_case_pulse <= '1';
        wait for 1 ps;
        test_case_pulse <= '0';
        Buzz1 <= '0';
        wait for 10 ns;
        MasterReset <= '0';
        wait for 10 ns;
        MasterReset <= '1';
        wait for 10 ns;
        Buzz1 <= '1';
        wait for 50 ns;

    	-- End Simulation
        wait;
    end process;
end Behavioral;

