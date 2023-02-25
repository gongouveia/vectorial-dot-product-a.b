
-- Cria entidade


--Referências (adapted from) :
--          https://vhdlguru.blogspot.com/2010/03/matrix-multiplication-in-vhdl.html

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use ieee.fixed_pkg.all;

library work;
use work.mat_ply.all;



entity test_mat is
port (clk : in std_logic;
       --inputs
    a : in input1_size;
    b : in input2_size;
       --outputs
    prod : out sfixed(7 downto -8)
);
end test_mat;



architecture Behavioral of test_mat is
begin
    process(clk)
        begin
        if(clk'event and clk='1') then
            -- Calls the dot product function
            prod<=dot_product(a,b); 
        end if;
    end process;
end Behavioral;