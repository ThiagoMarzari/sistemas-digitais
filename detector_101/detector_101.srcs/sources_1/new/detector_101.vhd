LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY detector_101 IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        entrada : IN STD_LOGIC;
        saida : OUT STD_LOGIC
    );
END detector_101;

ARCHITECTURE Behavioral OF detector_101 IS

    TYPE state_type IS (S0, S1, S2, S3);
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
        saida <= '0';

        CASE estado IS
            WHEN S0 =>
                IF entrada = '1' THEN
                    prox_estado <= S1;
                ELSE
                    prox_estado <= S0;
                END IF;
            WHEN S1 =>
                IF entrada = '0' THEN
                    prox_estado <= S2;
                ELSE
                    prox_estado <= S1;
                END IF;
            WHEN S2 =>
                IF entrada = '1' THEN
                    prox_estado <= S3;
                ELSE
                    prox_estado <= S0;
                END IF;
            WHEN S3 =>
                saida <= '1';
                IF entrada = '1' THEN
                    prox_estado <= S1;
                ELSE
                    prox_estado <= S2;
                END IF;
        END CASE;

    END PROCESS;

END Behavioral;