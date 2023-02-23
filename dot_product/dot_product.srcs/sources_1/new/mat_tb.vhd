

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
library work;
use work.mat_ply.all;

ENTITY mat_tb IS
END mat_tb;

ARCHITECTURE behavior OF mat_tb IS
    --signals declared and initialized to zero.
    signal clk : std_logic := '0';
    signal a : input1_size:=(others =>  (others => '0'));
    signal b : input2_size:=(others =>  (others => '0'));
    signal sum_of_products : unsigned(31 downto 0) := "00000000000000000000000000000000";
    -- Clock period definitions
    constant clk_period : time := 0.5 ns;

BEGIN
-- Instantiate the Unit Under Test (UUT)
uut: entity work.test_mat PORT MAP (clk,a,b,sum_of_products);   
    -- Clock process definitions
clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        --first set of inputs..
        a <= ("0000000000000001","0000000000000010","0000000000000011","0000000000000100","0000000000000101");
        b <= ("0000000000000001","0000000000000010","0000000000000011","0000000000000100","0000000000000101");
        wait for 0.5 ns;
        --second set of inputs can be given here and so on.
        a <= ("0000000000000011","0000000000000010","0000000000000011","0000000000000100","0000000000000101");
        b <= ("0000000000000011","0000000000000010","0000000000000011","0000000000000100","0000000000000101");
        wait for 0.5 ns;
    end process;

END;