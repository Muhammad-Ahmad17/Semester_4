LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.My_Package.ALL;

entity UpDownBinaryCounter is
    port (
        binOut : out std_logic_vector(2 downto 0); 
        opcode : in std_logic; 
        clk : in std_logic     
    );
end UpDownBinaryCounter;

architecture Behavioral of UpDownBinaryCounter is
    -- Signals for Q outputs and D inputs
    signal q0, q1, q2 : std_logic;
    signal qnot0, qnot1, qnot2 : std_logic;
    signal d0, d1, d2 : std_logic;
begin

    U1 : myDLatch port map (clk => clk, D => d0, Q => q0, Q_not => qnot0);
    U2 : myDLatch port map (clk => clk, D => d1, Q => q1, Q_not => qnot1);
    U3 : myDLatch port map (clk => clk, D => d2, Q => q2, Q_not => qnot2);

	 -- up/down counter  
    d0 <= q0 xor '1';
    d1 <= (q1 xor q0) when opcode = '0' else (q1 xor qnot0);
    d2 <= (q2 xor (q1 and q0)) when opcode = '0' else (q2 xor (qnot1 and qnot0));

    binOut <= d2 & d1 & d0;
end Behavioral;