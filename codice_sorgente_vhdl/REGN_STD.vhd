LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY REGN_STD IS
GENERIC (N: POSITIVE := 33);
PORT (R : IN STD_LOGIC_VECTOR(N DOWNTO 0);
LOAD: IN STD_LOGIC;
ClOCK, RESETN : IN STD_LOGIC;
Q : OUT STD_LOGIC_VECTOR(N DOWNTO 0));
END REGN_STD;
ARCHITECTURE Behavior OF REGN_STD IS
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