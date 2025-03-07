LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.My_Package.ALL;

ENTITY FourBitCounter is
    port (
        binOut : out std_logic_vector(3 downto 0); 
        clk : in std_logic
    );
end FourBitCounter;

architecture Behavioral of FourBitCounter is
    signal q0, q1, q2, q3 : std_logic;
    signal qnot0, qnot1, qnot2, qnot3 : std_logic;
    signal d1, d2, d3 : std_logic;

begin
    U1 : myDLatch 
        port map (
            clk => clk,
            D => qnot0,
            Q => q0,
            Q_not => qnot0
        );

    U2 : myDLatch
        port map (
            clk => clk,
            D => d1,
            Q => q1,
            Q_not => qnot1
        );

    U3 : myDLatch
        port map (
            clk => clk,
            D => d2,
            Q => q2,
            Q_not => qnot2
        );

    U4 : myDLatch
        port map (
            clk => clk,
            D => d3,
            Q => q3,
            Q_not => qnot3
        );

    d1 <= q1 xor q0;
    d2 <= q2 xor (q1 and q0);
    d3 <= q3 xor (q2 and (q1 and q0));

    binOut <= q3 & q2 & q1 & q0;

end Behavioral;

