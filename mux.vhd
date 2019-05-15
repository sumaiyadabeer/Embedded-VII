library ieee;
use ieee.std_logic_1164.all;

entity mu is
port(
i0 :  in std_logic;
i1 : in std_logic;
s: in std_logic;
op : out std_logic
);
 end entity;

architecture arch of mu is 
begin
op <= (not(s) and i0) or( s and i1);

end arch;