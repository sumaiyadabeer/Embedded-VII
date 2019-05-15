library ieee;
use ieee.std_logic_1164.all;

entity e1 is 
	port(
		i0,i1,i2,i3 : IN STD_LOGIC;
		o0,o1,o2,o3 : OUT STD_LOGIC


	     );
end e1;

architecture a1 of e1 is 

signal  s0: std_logic;
	begin
	o0 <= i0 xor i1;
	o1 <= i1 xor i2;
	o2 <= i2 xor i3;
	o3 <= i3;

	end a1;

library ieee;
use ieee.std_logic_1164.all;

entity e2 is 
	port(

	j0,j1,j2,j3 : IN std_logic;
	p0,p1,p2,p3  : out std_logic

	);
end e2;
architecture a2 of e2 is

	begin


p0<=j1;
p1 <= not(j1 or j2) or (j0 and j1 and j2) or (not( j0 or j1) and j2);
p2 <= (not(j0 or j1) and j2) or  (not( j1 or j3 ) and j0) or ( not j3 and j1) or (not(j0 or j1 or j2) and j3);
p3 <= (not(j0 or j1)and j3) or (not(j2) and j3 ) or (j0 and (not j3)and j2) or (j0 and (not j3)and j2);
		end a2;




library ieee;
use ieee.std_logic_1164.all;

entity e is
 
	port (
	i0,i1,i2,i3 : IN STD_LOGIC;
	p0,p1,p2,p3 , t0,t1,t2,t3 : out std_logic
	
	);


end e;

architecture a of e is 

component e1  
	port(
	i0,i1,i2,i3 : IN STD_LOGIC;
	o0,o1,o2,o3 : OUT STD_LOGIC


	     );
end component;


component e2
	port(

	j0,j1,j2,j3 : IN std_logic;
	p0,p1,p2,p3  : out std_logic

	);
end component;	

signal s0,s1,s2,s3 : std_logic;
	begin
pm1: e1 port map (i0,i1,i2,i3,s0,s1,s2,s3);
pm2: e2 port map (s0,s1,s2,s3,p0,p1,p2,p3);
t0 <= s0;
t1 <= s1;
t2 <= s2;
t3 <= s3;

	end a;