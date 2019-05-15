library ieee;
	use ieee.std_logic_1164.all;

entity half_add is 
PORT(X,Y: IN STD_LOGIC ;
	SUM,CARRY: OUT STD_LOGIC);

END half_add;

architecture myadd of half_add is
begin 
sum<= x xor y;
carry<= x and y;

end myadd;






