-- filepath: c:\Users\laboratorio\Desktop\sistemas-digitais\porta_senha\porta_senha.srcs\sim_1\new\tb_porta_senha.vhd
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_porta_senha IS
END tb_porta_senha;

ARCHITECTURE Behavioral OF tb_porta_senha IS

  COMPONENT porta_senha
    PORT (
      clk     : IN  STD_LOGIC;
      reset   : IN  STD_LOGIC;
      entrada : IN  STD_LOGIC;
      aberta  : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL clk     : STD_LOGIC := '0';
  SIGNAL reset   : STD_LOGIC := '0';
  SIGNAL entrada : STD_LOGIC := '0';
  SIGNAL aberta  : STD_LOGIC;

BEGIN
  DUT: porta_senha
    PORT MAP (
      clk     => clk,
      reset   => reset,
      entrada => entrada,
      aberta  => aberta
    );

  -- Clock geração: 10ns
  clk_process : PROCESS
  BEGIN
    WHILE TRUE LOOP
      clk <= '0';
      WAIT FOR 5 ns;
      clk <= '1';
      WAIT FOR 5 ns;
    END LOOP;
  END PROCESS;

  -- Stimulus process
  stim_proc: PROCESS
  BEGIN
    -- Inicializa
    reset <= '1';
    WAIT FOR 12 ns;
    reset <= '0';

    -- Sequência errada
    entrada <= '1'; WAIT FOR 10 ns;
    entrada <= '0'; WAIT FOR 10 ns;
    entrada <= '1'; WAIT FOR 10 ns;

    -- Reset
    reset <= '1'; WAIT FOR 10 ns;
    reset <= '0'; WAIT FOR 10 ns;

    -- Sequência correta: 1, 1, 0, 1
    entrada <= '1'; WAIT FOR 10 ns;
    entrada <= '1'; WAIT FOR 10 ns;
    entrada <= '0'; WAIT FOR 10 ns;
    entrada <= '1'; WAIT FOR 10 ns;

    -- Porta deve abrir (aberta = '1')
    WAIT FOR 20 ns;

    -- Testa reinício após senha correta
    entrada <= '0'; WAIT FOR 10 ns;
    entrada <= '1'; WAIT FOR 10 ns;

    WAIT FOR 30 ns;
    -- Finaliza simulação
    WAIT;
  END PROCESS;

END Behavioral;