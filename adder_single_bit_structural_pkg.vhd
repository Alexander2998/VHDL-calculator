--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Alex Chen
--
--       LAB NAME:  <lab 2 1 bit adder>
--
--      FILE NAME:  adder_single_bit_structural_pkg.vhd
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--    This design declares the package  
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
-- | 08/23/20 | XXX  | 1.0 | Created
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE adder_single_bit_structural_pkg IS

  COMPONENT adder_single_bit_structural IS
    PORT (
        a  : IN  std_logic;

        b  : IN  std_logic;

        cin  : IN  std_logic;

        --

        sum : OUT std_logic;
		  
		cout: OUT std_logic
      );
  END COMPONENT;
  
   COMPONENT alu_and 
		port(
		input1,input2: in std_logic; 
		DataOut: out std_logic
		);
	 END COMPONENT;
	 
	 
  	 COMPONENT alu_or 
		port(
		input1,input2: in std_logic; 
		output: out std_logic
		);
	 END COMPONENT;


	 COMPONENT alu_xor 
		port(
		input1,input2: in std_logic; 
		output: out std_logic
		);
	 END COMPONENT;
	 
END PACKAGE adder_single_bit_structural_pkg;




