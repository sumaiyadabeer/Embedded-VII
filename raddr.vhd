library ieee;
use ieee.std_logic_1164.all;

entity fa is
	port(A,B, Cin:in std_logic;
        S,Cout:out std_logic);
end fa;

architecture myadd of fa is
begin
S<= A xor B xor Cin;
Cout<= (A and B) or ((A xor B)and Cin);
end myadd;

library ieee;
use ieee.std_logic_1164.all;

entity addr is
	port (A1,A2,A3,A4,B1,B2,B3,B4,C:in std_logic;
	S1, S2, S3, S4,Carry:out std_logic);
end addr;

architecture as of addr is
signal C1,C2, C3: std_logic;
component fa
port(A,B, Cin:in std_logic;
        S,Cout:out std_logic);
end component;
begin 

	f1:fa port map (A1,B1,C,S1,C1);
	f2:fa port map (A2,B2,C1,S2, C2);
	f3:fa port map (A3,B3,C2,S3, C3);
	f4:fa port map (A4,B4,C3,S4, Carry);


	
end as; 


library ieee;
use ieee.std_logic_1164.all;

entity badd is
	port (A1,A2,A3,A4,B1,B2,B3,B4,C:in std_logic;
	T1, T2, T3, T4,Carry:out std_logic);
end badd;

architecture bd of badd is
signal C1,C2, C3 , C4 , R1 ,R2, R3,R4 : std_logic;
signal tmp : std_logic;
component addr
port (A1,A2,A3,A4,B1,B2,B3,B4,C:in std_logic;
	S1, S2, S3, S4,Carry:out std_logic);
end component;
begin 
pm0 : addr port map (A1,A2,A3,A4,B1,B2,B3,B4,C,C1,C2,C3,C4,Carry);
	T1 <= C1;
	T2 <= C2;
	T3 <= C3;
	T4 <= C4;	
pm : addr port map( C1,C2,C3,C4,'0', '1', '1', '0', C, R1,R2,R3,R4);
process (C1,C2,C3,C4,R1,R2,R3,R4, C)
begin
        if (C = '1') then
	--pm : addr port map( C1,C2,C3,C4,'0', '1', '1', '0', C, T1,T2,T3,T4);
	T1 <= R1;
	T2 <= R2;
	T3 <= R3;
	T4 <= R4;	
	end if;
tmp <= C4 and (C3 or C2 or C1);
	
        if(tmp = '1') then
	--pm1 : addr port map( C1,C2,C3,C4,'0', '1', '1', '0', C, T1,T2,T3,T4);
	T1 <= R1;
	T2 <= R2;
	T3 <= R3;
	T4 <= R4;	
	end if;
 	--wait;
end process;
end bd; 


