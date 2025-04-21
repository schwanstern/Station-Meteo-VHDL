----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2025 10:19:51
-- Design Name: 
-- Module Name: tb_compteur4 - Behavioral
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

entity tb_compteur4 is
--  Port ( );
end tb_compteur4;

architecture testbench of tb_compteur4 is
    signal clk   : STD_LOGIC := '0';
    signal rst   : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR(1 downto 0);

    constant clk_period : time := 10 ns;

    component compteur_4
        Port (
            clk   : in  STD_LOGIC;
            rst   : in  STD_LOGIC;
            count : buffer STD_LOGIC_VECTOR (1 downto 0)
        );
    end component;

begin
    uut: compteur_4
        port map (
            clk   => clk,
            rst   => rst,
            count => count
        );

    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    stim_proc: process
    begin
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        wait for 200 ns;
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        wait;
    end process;
end testbench;
