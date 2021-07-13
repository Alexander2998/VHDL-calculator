--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME: Alex Chen 
--
--       LAB NAME:  <lab 2 1 bit adder>
--
--      FILE NAME:  adder_single_bit_structural_tb.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design is the structural testbench.
--
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 09/2/2020| XXX  | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

------------------------------------------------------------------------------
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- ||||                                                                   ||||
-- ||||                    COMPONENT PACKAGE                              ||||
-- ||||                                                                   ||||
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------

-- include ieee packages here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

-- include your packages here
LIBRARY work;
USE work.adder_single_bit_structural_pkg.ALL;
 

ENTITY adder_single_bit_structural_tb IS

END ENTITY adder_single_bit_structural_tb;

-------------------------------------------------------------------------------

ARCHITECTURE test OF adder_single_bit_structural_tb IS

    ---------------------------------------------------------------------------
    -- define sigals that you will need to test UUT
    ---------------------------------------------------------------------------
signal in_vect: std_logic_vector(2 downto 0):=(others=>'0'); 
signal sum_tb,cout_tb: std_logic; 
signal a_tb,b_tb, cin_tb: std_logic; 
signal sum_truth, cout_truth: std_logic; 

    -- <define your signals here> 
    
BEGIN  -- test

a_tb<=in_vect(0); 
b_tb<=in_vect(1); 
cin_tb<= in_vect(2); 

sum_truth <= (a_tb xor b_tb) xor (cin_tb); 
cout_truth<= (a_tb and b_tb) or (cin_tb and (a_tb xor b_tb)); 
    ---------------------------------------------------------------------------
    -- instantiate the unit under test (UUT)
    ---------------------------------------------------------------------------
    UUT : adder_single_bit_structural 
    PORT MAP (
        a=>a_tb,
		b=>b_tb, 
		cin=>cin_tb,
        -- <connect UUT I/O to testbench signals>
        -- <format: component signal => tb signal> 
		sum=>sum_tb,
		cout=>cout_tb
        
        );


    ---------------------------------------------------------------------------
    -- the process will apply the test vectors to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN  -- PROCESS stimulus


        -- INSERT YOUR TEST VECTORS HERE

	for i in 0 to 2**in_vect'length -1 loop 
			in_vect <= std_logic_vector(to_unsigned(i, in_vect'length));
		wait for 10 ns;
		
		assert(sum_truth=sum_tb and cout_truth= cout_tb)
		report "Test is incorrect."
		severity failure; 
		end loop; 

report "Successful simulation."; 

        -----------------------------------------------------------------------
        -- stop simulation, wait here forever
        -----------------------------------------------------------------------
        wait;
    END PROCESS stimulus;

END ARCHITECTURE test;

-------------------------------------------------------------------------------

