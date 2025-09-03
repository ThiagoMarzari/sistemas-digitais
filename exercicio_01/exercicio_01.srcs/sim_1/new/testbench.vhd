library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    -- Declaração dos sinais para simulação
    signal clk : STD_LOGIC := '0';
    signal A, B : STD_LOGIC := '0';
    signal Y : STD_LOGIC := '0';
    signal int_var_tb : STD_LOGIC_VECTOR(3 downto 0); 
    signal vector_var_tb : STD_LOGIC_VECTOR(3 downto 0);

    -- Definir o período do clock
    constant clk_period : time := 10 ns;

begin
    -- Instanciação da Unidade Sob Teste (UUT)
    uut: entity work.variaveis_ex
        port map (
            clk => clk,
            A => A,
            B => B,
            Y => Y,
            int_var_out => int_var_tb,
            vector_var_out => vector_var_tb
        );
    
    -- Gerador de clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;
    
    -- Estímulos de teste
    stim_proc: process
    begin
        -- Estímulo 1: A = 0, B = 0
        A <= '0'; B <= '0';
        wait for 5 ns;

        -- Estímulo 2: A = 0, B = 1
        A <= '0'; B <= '1';
        wait for 5 ns;

        -- Estímulo 3: A = 1, B = 0
        A <= '1'; B <= '0';
        wait for 5 ns;

        -- Estímulo 4: A = 1, B = 1
        A <= '1'; B <= '1';
        wait for 5 ns;

        -- Finaliza a simulação após 100 ns
        wait for 100 ns;
        assert false report "Fim da simulação" severity note;
        wait;
    end process;
end Behavioral;
