--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME: Alex Chen 
--
--       LAB NAME:  <lab 2 1 bit adder>
--
--      FILE NAME:  adder_single_bit_structural.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design will setup the structural portion of the lab
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
-- |||| 
-- |||| COMPONENT DESCRIPTION 
-- |||| 
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.adder_single_bit_structural_pkg.ALL;

ENTITY adder_single_bit_structural IS

    PORT (

        a  : IN  std_logic;

        b  : IN  std_logic;

        cin  : IN  std_logic;

        --

        sum : OUT std_logic;
		  
		cout: OUT std_logic

        );

END ENTITY adder_single_bit_structural;


ARCHITECTURE structure OF adder_single_bit_structural IS

 

    SIGNAL And3_Result : std_logic;

    SIGNAL And2_Result : std_logic;
	 
	 signal And1_Result : std_logic; 

    --

   
BEGIN


 xor1 : alu_xor PORT MAP (

        input1 => a,

        input2 => b,

        --

        output   => And2_Result

        );
		
    and1 : alu_and

        PORT MAP (

            input1 => cin,

            input2 => And2_Result, --output of xor1

            --

            DataOut   => And3_Result

            );

		and2 : alu_and

     

        PORT MAP (

            input1 => b,

            input2 => a,

            --

            DataOut   => And1_Result

            );

    or2 : alu_or


        PORT MAP (

            input1 =>And3_Result ,

            input2 => And1_Result,

            --

            output => cout

            );
		  
	xor2: alu_xor port map(
		  input1 =>And2_Result, 
		  input2 =>cin, 
		  output =>sum 
	);

END ARCHITECTURE structure;