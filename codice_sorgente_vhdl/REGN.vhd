LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY REGN IS
GENERIC (N: POSITIVE := 33);
PORT (R : IN SIGNED(N DOWNTO 0);
LOAD: IN STD_LOGIC;
ClOCK, RESETN : IN STD_LOGIC;
Q : OUT SIGNED(N DOWNTO 0));
END REGN;
ARCHITECTURE Behavior OF REGN IS
BEGIN
PROCESS (CLOCK, RESETN)
BEGIN
IF (RESETN = '0') THEN
Q <= (OTHERS => '0');
ELSIF (CLOCK'EVENT AND CLOCK = '1') THEN
IF LOAD='1' THEN
Q <= R;
END IF;
END IF;
END PROCESS;
END Behavior;