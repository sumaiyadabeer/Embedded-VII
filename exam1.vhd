library ieee;
use ieee.std_logic_1164.all;

entity tflfp is
port(
 data : in std_logic;
clk: in std_logic;
reset: in std_logic;
q: out std_logic
);

end entity;

architecture arch of tflfp is
begin
 process (clk) begin
	if(rising_edge(clk)) then 
		if (reset = '1') then
			q <= '0';
		else 
			q <= not data;
		end if;
 	end if;

 end process;



end arch;


library ieee;
use ieee.std_logic_1164.all;

entity countt is
port(
clock : in std_logic;
reset : in std_logic;
c0 :out std_logic;
c1 :out std_logic;
c2 : out std_logic
);
end entity;

architecture arch1 of countt is
component tflfp is
port(
 data : in std_logic;
clk: in std_logic;
reset: in std_logic;
q: out std_logic
);

end component;


signal a, b,c,x,y,z ,k: std_logic;
begin
--c1<=0;
--c0<=0;
--c2<=0;
x <='0';
y<='0';
z<= '0';

x<=(not y) or (y and(not z));
z<= (x and y) or (y and z);
y<= z or( x and (not y));

p0: tflfp port map (x,clock,reset,a);
p1: tflfp port map (y,clock,reset,b);
p2: tflfp port map (z,clock,reset,c);

c0<=a;
c1<=b;
c2<=c;

end arch1;