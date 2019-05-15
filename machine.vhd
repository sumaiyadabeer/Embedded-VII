library ieee;
use ieee.std_logic_1164.all;

entity moore is
port (
clk :in std_logic;
inp : in std_logic;
rst : in std_logic;
opt : out std_logic
);


end entity;


architecture arch of moore is
type state is ( s1 , s2 , s3 ) ;
signal pstate , nstate : state;
begin

process(clk)
begin
if (falling_edge(clk)) then
if(rst = '1') then 
pstate <= s1;
else
pstate <= nstate;
end if;
end if;

end process;

oppt : process( pstate)
begin
case pstate is
when s1 =>
opt <= '0';
when s2 =>
opt <= '1';
when s3 =>
opt <= '0';
when others => 
opt <= '1';
end case;
end process;


trn : process( pstate , inp )
begin
case (pstate) is
when s1 =>
if (inp = '1') then
nstate <= s1;
else
nstate <= s2;
end if;

when s2 =>
if (inp = '1') then
nstate <= s3;
else
nstate <= s1 ;
end if;

when s3 =>
if (inp = '1') then
nstate <= s2;
else
nstate <= s3 ;
end if;

when others => 
nstate <= s1;

end case;

end process;





end arch;