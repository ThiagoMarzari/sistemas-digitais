
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY semaforo IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    verde : OUT STD_LOGIC;
    amarelo : OUT STD_LOGIC;
    vermelho : OUT STD_LOGIC
  );
END semaforo;
ARCHITECTURE moore OF semaforo IS
  -- Definição dos estados
  TYPE state_type IS (SVERDE, SAMARELO, SVERMELHO);
  SIGNAL estado, prox_estado : state_type;
BEGIN
  -- Processo de transição de estado
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      estado <= SVERDE;
    ELSIF rising_edge(clk) THEN
      estado <= prox_estado;
    END IF;
  END PROCESS;

  -- Lógica de saída e próximo estado
  PROCESS (estado)
  BEGIN
    -- Saídas padrão
    verde <= '0';
    amarelo <= '0';
    vermelho <= '0';
    CASE estado IS
      WHEN SVERDE =>
        verde <= '1';
        prox_estado <= SAMARELO;
      WHEN SAMARELO =>
        amarelo <= '1';
        prox_estado <= SVERMELHO;
      WHEN SVERMELHO =>
        vermelho <= '1';
        prox_estado <= SVERDE;
      WHEN OTHERS =>
        prox_estado <= SVERDE;
    END CASE;
  END PROCESS;
END moore;