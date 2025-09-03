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
            -- La�o de controle FOR
            for i in 0 to 3 loop
                -- Estrutura condicional IF-ELSE
                if int_var > 5 then
                    vector_var(i) <= '1';      -- Atribui '1' � posi��o i do vetor
                    int_var := int_var - 1;    -- Decrementa a vari�vel inteira
                else
                    vector_var(i) <= '0';      -- Caso contr�rio, atribui '0' � posi��o i do vetor
                    int_var := int_var + 1;    -- Incrementa a vari�vel inteira
                end if;
            end loop;

            -- Atribui��o de sa�da
            Y <= A AND B;  -- Simula��o de uma porta AND simples
        end if;
    end process;

    -- Mapeando sinais para sa�da
    int_var_out <= std_logic_vector(to_unsigned(int_var, 4));  -- Converte o valor inteiro para std_logic_vector
    vector_var_out <= vector_var;

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tesbench is
--  Port ( );
end tesbench;

architecture Behavioral of tesbench is

begin


end Behavioral;
