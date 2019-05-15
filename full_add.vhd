library ieee;
	use ieee.std_logic_1164.all;

entity full_add is 
PORT(X,Y ,C: IN STD_LOGIC ;
	SUM,CARRY: OUT STD_LOGIC);

END full_add;

architecture myadd of full_add is
begin 
sum<= x xor y xor C;
carry<= (x and y) or (Y and C) or (X and C) ;

end myadd;