library ieee;
use ieee.std_logic_1164.all;
entity fp is
port( 
i: in std_logic;
o: out std_logic;
clk :in std_logic
);
end fp;
architecture behavioural of fp is
proces(clk)
begin :
if(rising_edge(clk) ) then
o<=i
end if;
end process;
end behavioural;
entity pal is 
port (
clk : in std_logic;
p:in std_logic ;
q: out std_logic;
architecture arc of pal is
signal a,b,c,d,x,y : std_logic 
component fp is 
port (
o: out std_logic;
clk: in std_logic;
d: in std_logic;
);
end component;
a1: fp port map(
clk=>clk;
d=> p  
o=> b 
)
a2: fp port map(
clk=>clk;
d=> b   
o=> c 
)
a3: fp port map(
clk=>clk;
d=> b 
o=> c  
)a4: fp port map(
clk=>clk;
d=> c  
o=> d 
)
a5: fp port map(
clk=>clk;
d=> d 
o=> a  
)
x<=(a and b) or (not (a) and not (b));
y<=(c and d) or (not (c) and not (d));
o<= (x and y) ;
end arc;

 