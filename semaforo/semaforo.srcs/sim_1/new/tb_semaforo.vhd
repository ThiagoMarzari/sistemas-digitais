LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_semaforo IS
END tb_semaforo;

ARCHITECTURE sim OF tb_semaforo IS
  -- Component declaration
  COMPONENT semaforo
    PORT (
      clk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      verde : OUT STD_LOGIC;
      amarelo : OUT STD_LOGIC;
      vermelho : OUT STD_LOGIC
    );
  END COMPONENT;

  -- Signals to connect to DUT
  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL reset : STD_LOGIC := '0';
  SIGNAL verde : STD_LOGIC;
  SIGNAL amarelo : STD_LOGIC;
  SIGNAL vermelho : STD_LOGIC;
BEGIN
  -- Instantiate DUT
  uut : semaforo PORT MAP(
    clk => clk,
    reset => reset,
    verde => verde,
    amarelo => amarelo,
    vermelho => vermelho
  );

  -- Clock generation
  clk_process : PROCESS
  BEGIN
    WHILE true LOOP
      clk <= '0';
      WAIT FOR 10 ns;
      clk <= '1';
      WAIT FOR 10 ns;
    END LOOP;
    WAIT;
  END PROCESS;

  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- Inicializa com reset
    reset <= '1';
    WAIT FOR 25 ns;
    reset <= '0';
    -- Aguarda ciclos para observar transições
    WAIT FOR 100 ns;
    -- Finaliza simulação
    WAIT;
  END PROCESS;
END sim;