library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This is a description of a controller for a Jeopardy style buzzing system.
--
-- The basic function is an s/r latch for each buzzer reset by the other
-- other latches and a master reset switch.
--
-- The design assumes the following gates are available: 
--     9 4-input AND gates
--     12 2-input NAND gates

entity Top_Level is
	Port (
		-- Inputs: 6 Active Low Buzzers, 1 Active Low Reset
		Buzz1, Buzz2, Buzz3, Buzz4, Buzz5, Buzz6, MasterReset : in STD_LOGIC;
		-- Outputs: 6 Active Low Indicators
		Ind1, Ind2, Ind3, Ind4, Ind5, Ind6 : out STD_LOGIC
	);
end Top_Level;

architecture Gate_Logic of Top_Level is
	-- Latch Intermediates
	signal Latch1_Q, Latch1_QP, Latch2_Q, Latch2_QP, Latch3_Q, Latch3_QP, Latch4_Q, Latch4_QP, Latch5_Q, Latch5_QP, Latch6_Q, Latch6_QP : STD_LOGIC;

	-- Reset Intermediates
	signal Reset1234, Reset3456, Reset1256 : STD_LOGIC;
begin
	-- Resets
	Reset1234 <= Latch1_Q and Latch2_Q and Latch3_Q and Latch4_Q;
	Reset3456 <= Latch3_Q and Latch4_Q and Latch5_Q and Latch6_Q;
	Reset1256 <= Latch1_Q and Latch2_Q and Latch5_Q and Latch6_Q;

	-- Latch 1
	Latch1_QP <= Buzz1 nand Latch1_Q;
	Latch1_Q <= (Reset3456 and Latch2_Q and MasterReset and '1') nand Latch1_QP;
	Ind1 <= Latch1_Q;

	-- Latch 2
	Latch2_QP <= Buzz2 nand Latch2_Q;
	Latch2_Q <= (Reset3456 and Latch1_Q and MasterReset and '1') nand Latch2_QP;
	Ind2 <= Latch2_Q;

	-- Latch 3
	Latch3_QP <= Buzz3 nand Latch3_Q;
	Latch3_Q <= (Reset1256 and Latch4_Q and MasterReset and '1') nand Latch3_QP;
	Ind3 <= Latch3_Q;

	-- Latch 4
	Latch4_QP <= Buzz4 nand Latch4_Q;
	Latch4_Q <= (Reset1256 and Latch3_Q and MasterReset and '1') nand Latch4_QP;
	Ind4 <= Latch4_Q;

	-- Latch 5
	Latch5_QP <= Buzz5 nand Latch5_Q;
	Latch5_Q <= (Reset1234 and Latch6_Q and MasterReset and '1') nand Latch5_QP;
	Ind5 <= Latch5_Q;

	-- Latch 6
	Latch6_QP <= Buzz6 nand Latch6_Q;
	Latch6_Q <= (Reset1234 and Latch5_Q and MasterReset and '1') nand Latch6_QP;
	Ind6 <= Latch6_Q;

end Gate_Logic;
