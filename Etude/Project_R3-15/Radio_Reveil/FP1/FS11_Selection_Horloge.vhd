----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 20:57:23
-- Design Name: 
-- Module Name: FS11_Selection_Horloge - selecteur
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

entity FS11_Selection_Horloge is
    Port ( CLK_1Hz : in STD_LOGIC;
           CLK_5Hz : in STD_LOGIC;
           CLK_50Hz : in STD_LOGIC;
           CLK_500Hz : in STD_LOGIC;
           CLK_1kHz : in STD_LOGIC;
           BP_PROG : in STD_LOGIC;
           BP_FAST : in STD_LOGIC;
           BP_SLOW : in STD_LOGIC;
           CLK_HR : out STD_LOGIC);
end FS11_Selection_Horloge;

architecture selecteur of FS11_Selection_Horloge is
begin
  CLK_HR <= CLK_500Hz when BP_PROG = '1' and BP_FAST = '1' and BP_SLOW = '0' else
            CLK_1kHz  when BP_PROG = '1' and BP_SLOW = '1' and BP_FAST = '0' else
            CLK_1Hz; 
end selecteur;
