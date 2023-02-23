

-- Computes the dot product between 2 vectors
--References (adapted from) :
--          https://vhdlguru.blogspot.com/2010/03/matrix-multiplication-in-vhdl.html

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package mat_ply is


-- Initializes data
type input1_size is array (0 to 4) of unsigned(15 downto 0);
type input2_size is array (0 to 4) of unsigned(15 downto 0);
type output_size is array (0 to 4) of unsigned(31 downto 0);

function dot_product ( a : input1_size; b:input2_size ) return unsigned;

end mat_ply;


-- Initializes the package
package body mat_ply is
    
    function dot_product ( a : input1_size; b:input2_size) return unsigned is
        variable i,j : integer:=0;
        variable prod : output_size:=(others => (others => '0'));
        variable sum_of_prod : unsigned(31 downto 0) := "00000000000000000000000000000000";
        begin
        
            -- makes the product of the factors
            for i in 0 to 4 loop --(number of elements in the first matrix - 1)
                prod(i) := prod(i) + (a(i) * b(i));
             end loop;
             
             -- sum of products
             for j in 0 to 4 loop
                sum_of_prod := sum_of_prod + prod(j);
             end loop;
    -- Return the dot product value
    return sum_of_prod;
    end dot_product;
end mat_ply;
