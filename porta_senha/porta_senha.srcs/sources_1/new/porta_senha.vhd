LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY porta_senha IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    entrada : IN STD_LOGIC;
    aberta : OUT STD_LOGIC
  );
END porta_senha;

ARCHITECTURE moore OF porta_senha IS

  TYPE state_type IS (S0, S1, S11, S110, S1101);
  SIGNAL estado, prox_estado : state_type;

BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      estado <= S0;
    ELSIF rising_edge(clk) THEN
      estado <= prox_estado;
    END IF;
  END PROCESS;

  PROCESS (estado, entrada)
  BEGIN
    aberta <= '0'; --Padrao: Porta fechada

    CASE estado IS
      WHEN S0 =>
        IF entrada = '1' THEN
          prox_estado <= S1;
        ELSE
          prox_estado <= S0;
        END IF;
      WHEN S1 =>
        IF entrada = '1' THEN
          prox_estado <= S11;
        ELSE
          prox_estado <= S0;
        END IF;
      WHEN S11 =>
        IF entrada = '0' THEN
          prox_estado <= S110;
        ELSE
          prox_estado <= S11;
        END IF;
      WHEN S110 =>
        IF entrada = '1' THEN
          prox_estado <= S1101;
        ELSE
          prox_estado <= S0;
        END IF;
      WHEN S1101 =>
        aberta <= '1'; --Senha correta, porta aberta
        IF entrada = '1' THEN
          prox_estado <= S1;
        ELSE
          prox_estado <= S0;
        END IF;
      WHEN OTHERS =>
        prox_estado <= S0;
    END CASE;
  END PROCESS;

END moore;