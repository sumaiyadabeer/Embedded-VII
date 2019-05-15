--vhdl code for counter using T flip flop:
--code for T flip flop:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tffl is
port(t,rst,clk:in std_logic;
q,qb:out std_logic);
end tffl;

architecture Behavioral of tffl is
begin
process(clk,rst)
variable x:std_logic:='1';
begin
--wait on clk ;
if (clk' event and clk='1') then
if rst='1' then
x:='0';
elsif t='1' then
x:=not x;
else
x:=x;
end if;
end if;
q<=x;
qb<=not x;
end process;
end Behavioral;

--code for counter:

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tcounter is
port(clk,rst:in std_logic;
q,qbar:inout std_logic_vector(4 downto 0));
end tcounter;

architecture Behavioral of tcounter is
component tffl is
port(t,rst,clk:in std_logic;
q,qb:out std_logic);
end component;
signal k,l,m,n,o:std_logic;
begin

k <= not q(1);    --t2
l <= '1';         --t1
m <= '0';         --t0,t3,t4

q(0) <= '0';
q(3) <= '1';
q(4) <= '1';
--a1:tffl port map(m,rst,clk,q(0),qbar(0));
a2:tffl port map(l,rst,clk,q(1),qbar(1));
a3:tffl port map(k,rst,clk,q(2),qbar(2));


--a4:tffl port map(l,rst,clk,q(3),qbar(3));
--a5:tffl port map(l,rst,clk,q(4),qbar(4));

--k<=q(0); 
--l<=q(0) and q(1);
--m<=q(0) and q(1) and q(2);
--a1:tffl port map('1',rst,clk,q(0),qbar(0));
--a2:tffl port map(k,rst,clk,q(1),qbar(1));
--a3:tffl port map(l,rst,clk,q(2),qbar(2));
--a4:tffl port map(m,rst,clk,q(3),qbar(3));
end Behavioral;