----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.04.2025 20:57:23
-- Design Name: 
-- Module Name: FS12_Diviseur_Frequence - diviseur
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

entity FS12_Diviseur_Frequence is
    Port ( 
      CLK_1kHz   : in STD_LOGIC;
      CLK_500Hz  : out STD_LOGIC;
      CLK_50Hz   : out STD_LOGIC;
      CLK_5Hz    : out STD_LOGIC;
      CLK_1Hz    : out STD_LOGIC
      );
end FS12_Diviseur_Frequence;

architecture diviseur of FS12_Diviseur_Frequence is
-- le type integer permet de travailler avec des valeurs en base 10 et des opérations arithmétiques
  constant VAL_MAX_500Hz  : INTEGER := 2;   -- Rapport de division : 2
  constant VAL_MAX_50Hz   : INTEGER := 10;  -- Rapport de division : 10
  constant VAL_MAX_5Hz    : INTEGER := 10;  -- Rapport de division : 10
  constant VAL_MAX_1Hz    : INTEGER := 5;   -- Rapport de division : 5
  
  signal div_500Hz  : integer range VAL_MAX_500Hz downto 0 :=VAL_MAX_500Hz  ; --VAL_MAX_500Hz est la valeur par défaut
  signal div_50Hz   : integer range VAL_MAX_50Hz  downto 0 :=VAL_MAX_50Hz   ; --VAL_MAX_50Hz est la valeur par défaut
  signal div_5Hz    : integer range VAL_MAX_5Hz   downto 0 :=VAL_MAX_5Hz    ; --VAL_MAX_5Hz est la valeur par défaut
  signal div_1Hz    : integer range VAL_MAX_1Hz   downto 0 :=VAL_MAX_1Hz    ; --VAL_MAX_1Hz est la valeur par défaut

begin

  process (CLK_1kHz)
  begin
    if (CLK_1kHz'Event and CLK_1kHz='1') then
      if div_500Hz = 0 then 
        div_500Hz <= VAL_MAX_500Hz; 
      end if;
      if div_50Hz = 0 then 
        div_50Hz <= VAL_MAX_50Hz; 
      end if;
      if div_5Hz = 0 then 
        div_5Hz <= VAL_MAX_5Hz; 
      end if;
      if div_1Hz = 0 then 
        div_1Hz <= VAL_MAX_1Hz; 
      end if;
      div_500Hz <= div_500Hz-1;
      div_50Hz <= div_50Hz-1;
      div_5Hz <= div_5Hz-1;
      div_1Hz <= div_1Hz-1;
    end if;
    
  end process;

  CLK_500Hz <= '1'  when div_500Hz  = 1 else '0';
  CLK_50Hz  <= '1'  when div_50Hz   = 1 else '0';
  CLK_5Hz   <= '1'  when div_5Hz    = 1 else '0';
  CLK_1Hz   <= '1'  when div_1Hz    = 1 else '0';

end diviseur;
