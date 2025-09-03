library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
-- Port ();
end testbench;

architecture Behavioral of testbench is

    --Sinais de teste
    signal clk : STD_LOGIC := '0';
    signal A, B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;
    
    --Periodo do clock
    constant clk_period : time := 10 ns;

begin
     -- Instancia��o da Unidade Sob Teste (UUT)
   uut: entity work.variaveis_ex
       port map (
           clk => clk,
           A => A,
           B => B,
           Y => Y
       );

   -- Gerador de clock
   clk_process : process
   begin
       wait for clk_period / 2;
       clk <= '0';
       wait for clk_period / 2;
       clk <= '1';
   end process;

   -- Est�mulos de teste
   stim_proc: process
   begin
       -- Teste 1: A = 0, B = 0
       A <= '0'; B <= '0';
       wait for 20 ns;

       -- Teste 2: A = 0, B = 1
       A <= '0'; B <= '1';
       wait for 20 ns;

       -- Teste 3: A = 1, B = 0
       A <= '1'; B <= '0';
       wait for 20 ns;

       -- Teste 4: A = 1, B = 1
       A <= '1'; B <= '1';
       wait for 20 ns;

       -- Fim da simula��o
       wait;
   end process;

end Behavioral;
