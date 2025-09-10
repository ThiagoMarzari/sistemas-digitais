LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY detector_tb IS
    --  Port ( );
END detector_tb;

ARCHITECTURE Behavioral OF detector_tb IS
    -- Sinais de teste
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '1';
    SIGNAL entrada : STD_LOGIC := '0';
    SIGNAL saida : STD_LOGIC;

    -- Per�odo do clock
    CONSTANT clk_period : TIME := 10 ns;
BEGIN
    -- Instancia��o da UUT (Unit Under Test)
    uut : ENTITY work.detector_101
        PORT MAP(
            clk => clk,
            reset => reset,
            entrada => entrada,
            saida => saida
        );

    -- Gerador de clock
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Est�mulos de teste
    stim_proc : PROCESS
    BEGIN
        -- Reset inicial
        reset <= '1';
        WAIT FOR 2 * clk_period;
        reset <= '0';

        -- Sequ�ncia de bits para testar
        -- Espera-se detectar "101" => sa�da = '1'
        entrada <= '1';
        WAIT FOR clk_period; -- aplica '1'

        entrada <= '0';
        WAIT FOR clk_period; -- aplica '0'

        entrada <= '1';
        WAIT FOR clk_period; -- aplica '1' => sa�da deve ser '1'

        WAIT FOR 5 ns;
        entrada <= '0';
        reset <= '1';
        WAIT FOR 2 * clk_period;
        reset <= '0';

        -- Continua aplicando bits
        entrada <= '1';
        WAIT FOR clk_period;

        entrada <= '0';
        WAIT FOR clk_period;

        entrada <= '1';
        WAIT FOR clk_period;

        -- Final da simula��o
        WAIT;
    END PROCESS;
END Behavioral;