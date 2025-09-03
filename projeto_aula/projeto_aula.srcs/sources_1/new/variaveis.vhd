----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.09.2025 08:50:04
-- Design Name: 
-- Module Name: variaveis - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity variaveis is
--  Port ( );
end variaveis;

architecture Behavioral of variaveis is

begin

   --Sinais de teste
    signal clk : STD_LOGIC := '0';
    signal A, B : STD_LOGIC := '0';
    signal Y: STD_LOGIC;
    
    --Periodo do cclock
    constant clk_period : time := 10 ns;

    --Instanciação da unidade sob teste (UUT)