library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bcd_adder is
port(a,b: in unsigned(3 downto 0);
c1: in std_logic;
add: out unsigned(3 downto 0);
c2: out std_logic);
end bcd_adder;

architecture bcd of bcd_adder is
begin
process(a,b)
variable temp:unsigned(4 downto 0);
begin
temp := ('0' & a)+('0' & b)+("0000"& c1);
if(temp>9)then
c2<='1';
add<= resize((temp+"00110"),4);
else
c2<='0';
add<=temp(3 downto 0);
end if;
end process;
end architecture;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bcd_adder1 is
port(e,f: in unsigned(3 downto 0);
c11: in std_logic;
add1: out unsigned(3 downto 0);
c22: out std_logic);
end bcd_adder1;

architecture bcd1 of bcd_adder1 is
begin
process(e,f)
variable temp1:unsigned(4 downto 0);
begin
temp1 := ('0' & e)+('0' & f)+("0000"& c11);
if(temp1>9)then
c22<='1';
add1<= resize((temp1+"00110"),4);
else
c22<='0';
add1<=temp1(3 downto 0);
end if;
end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity final is
port (
x,y: in unsigned(3 downto 0);
w,z: in unsigned(3 downto 0);
car1: in std_logic;
add00: out unsigned(3 downto 0);
add11: out unsigned(3 downto 0);

car2: out std_logic
);
end final;


architecture f of final is 


component bcd_adder 

 port(a,b: in unsigned(3 downto 0);
c1: in std_logic;
add: out unsigned(3 downto 0);
c2: out std_logic);

end component ;


component bcd_adder1 

 port(e,f: in unsigned(3 downto 0);
c11: in std_logic;
add1: out unsigned(3 downto 0);
c22: out std_logic);

end component ;
signal s : std_logic;
signal s1 : std_logic;

begin
s => '0';

--pm1: bcd_adder port map (c2=>s0);
pm1: bcd_adder port map (a => x,
						 b => y,
						 c1=> s,
						 c2 =>s1,
						 add =>add00);
pm2: bcd_adder1 port map (e=> w,
						f => z,
						c11 =>s1,
						add1 => add11,
						c22 => car2);


end architecture;