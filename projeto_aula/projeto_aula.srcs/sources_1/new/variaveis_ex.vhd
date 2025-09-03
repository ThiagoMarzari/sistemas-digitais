library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- DECLARAÇÃO DA ENTIDADE
entity variaveis_ex is
    port (
        clk : in STD_LOGIC;  -- Sinal de clock
        A : in STD_LOGIC;    -- Entrada
        B : in STD_LOGIC;    -- Entrada
        Y : out STD_LOGIC    -- Saída
    );
end variaveis_ex;

architecture Behavioral of variaveis_ex is
begin
    process (clk)
        -- Declaração de variáveis de diferentes tipos
        variable bit_var : STD_LOGIC := '0';  -- Variável do tipo STD_LOGIC
        variable int_var : INTEGER := 10;      -- Variável do tipo INTEGER
        variable real_var : INTEGER := 13;       -- Variável do tipo REAL (corrigido)
        variable vector_var : STD_LOGIC_VECTOR(3 downto 0) := "0000"; -- Vetor de 4 bits
        variable bool_var : BOOLEAN := TRUE;   -- Variável do tipo BOOLEAN
        variable time_var : TIME := 10 ns;     -- Variável do tipo TIME
    begin
        if rising_edge(clk) then
            -- Laço de controle FOR
            for i in 0 to 3 loop
                -- Estrutura condicional IF-ELSE
                if int_var > 5 then
                    vector_var(i) := '1';      -- Atribui '1' à posição i do vetor
                    int_var := int_var - 1;    -- Decrementa a variável inteira
                else
                    vector_var(i) := '0';      -- Caso contrário, atribui '0' à posição i do vetor
                    int_var := int_var + 1;    -- Incrementa a variável inteira
                end if;
            end loop;
            
            -- Exemplo de uso do booleano e da variável do tipo REAL
            if bool_var = TRUE then
                real_var := real_var + 1;  -- Incrementa o valor da variável real
                bool_var := FALSE;           -- Modifica a variável boolean
            else
                real_var := real_var - 1;  -- Decrementa o valor da variável real
                bool_var := TRUE;            -- Modifica a variável boolean
            end if;

            -- Atribuição de saída
            Y <= A AND B;  -- Simulação de uma porta AND simples (corrigido)
        end if;
    end process;
end Behavioral;
