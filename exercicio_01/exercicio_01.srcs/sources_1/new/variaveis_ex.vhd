library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL; 

entity variaveis_ex is
    port (
        clk : in STD_LOGIC;  -- Sinal do clock
        A : in STD_LOGIC;    -- Entrada
        B : in STD_LOGIC;    -- Entrada
        Y : out STD_LOGIC;   -- Sa�da
        int_var_out : out STD_LOGIC_VECTOR(3 downto 0);  -- Sa�da do valor da vari�vel
        vector_var_out : out STD_LOGIC_VECTOR(3 downto 0) -- Sa�da do vetor
    );
end variaveis_ex;

architecture Behavioral of variaveis_ex is
    -- Definir vari�veis agora como sinais
    signal int_var : INTEGER := 10;  -- Usando sinal, n�o vari�vel
    signal vector_var : STD_LOGIC_VECTOR(3 downto 0) := "0000";  -- Sinal do vetor
begin
    process (clk)
    begin
        if rising_edge(clk) then
            -- Estrutura condicional IF-ELSE
            if int_var > 5 then
                -- Quando int_var > 5, setar o vetor inteiro para '1's
                vector_var <= "1111";  
                int_var <= int_var - 1;  -- Decrementa a vari�vel inteira
            else
                -- Quando int_var <= 5, setar o vetor inteiro para '0's
                vector_var <= "0000";  
                int_var <= int_var + 1;  -- Incrementa a vari�vel inteira
            end if;

            -- Atribui��o de sa�da
            Y <= A AND B;  -- Simula��o de uma porta AND simples
        end if;
    end process;

    -- Mapeando sinais para sa�da
    int_var_out <= std_logic_vector(to_unsigned(int_var, 4));  -- Converte o valor inteiro para std_logic_vector
    vector_var_out <= vector_var;

end Behavioral;
