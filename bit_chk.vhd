library ieee;
       use ieee.std_logic_1164.all;
 
 entity dff is
     port (
          data  :in  std_logic;-- Data input
          clk   :in  std_logic;-- Clock input
          reset :in  std_logic;-- Reset input
          q     :out std_logic -- Q output			
  
      );
  end entity;
  
  architecture rtl of dff is
  
  begin
      process (clk) begin
          if (rising_edge(clk)) then
              if (reset = '1') then
                  q <= '0';
              else
                  q <= data;
             end if;
          end if;
      end process;
 
  end architecture;

  
   library ieee;
       use ieee.std_logic_1164.all;
entity reg is
     port (
          input  :in  std_logic;-- Data input
          ck   :in  std_logic;-- Clock input
          rst :in  std_logic;-- Reset input
		  --q,qbar:inout std_logic_vector(5 downto 0));
          output    :out std_logic -- Q output
  
      );

end entity;

architecture arch of reg is
component dff is
     port (
          data  :in  std_logic;-- Data input
          clk   :in  std_logic;-- Clock input
          reset :in  std_logic;-- Reset input
          q     :out std_logic -- Q output
  
      );
  end component;
  
  signal a,b,c,d,e :std_logic;

begin
p1: dff port map( input , ck, rst,a);
p2: dff port map( a , ck, rst,b);
p3: dff port map( b , ck, rst,c);
p4: dff port map( c , ck, rst,d);
p5: dff port map( d , ck, rst,e);

output <= (a xnor e) and (b xnor d);

end architecture;