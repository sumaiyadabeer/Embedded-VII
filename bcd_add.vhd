library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_adder2 is
port(c,d: in unsigned(3 downto 0);
c3: in std_logic;
add1: out unsigned(3 downto 0);
c4: out std_logic);
end bcd_adder2;

architecture bcde of bcd_adder2 is
begin
process(c,d, c3)
variable temp1:unsigned(4 downto 0);
begin
temp1 := ('0'&c)+('0' & d)+("0000"& c3);
if(temp1>9)then
c4<='1';
add1<= resize((temp1+"00110"),4);
else
c4<='0';
add1<=temp1(3 downto 0);
end if;
end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_adder is
port(x,y: in unsigned(3 downto 0);
z,w: in unsigned(3 downto 0);
carry: in std_logic;
sum: out unsigned(3 downto 0);
sum1:out unsigned(3 downto 0);
car: out std_logic);
end bcd_adder;

architecture arch of bcd_adder is

signal carry1:std_logic;



component bcd_adder2 
port(c,d: in unsigned(3 downto 0);
c3: in std_logic;
add1: out unsigned(3 downto 0);
c4: out std_logic);
end component;


begin

n1: bcd_adder2 port map(c => x,
						d => y,
						c3 => carry,
						add1=> sum,
						c4 => carry1);
				

n2: bcd_adder2 port map(c => w,
						d => z,
						c3 => carry1,
						add1=> sum1,
						c4 => car);				



end arch; 



