LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY MOLT IS
GENERIC (N: POSITIVE := 15);
PORT ( M1: IN SIGNED(N DOWNTO 0);
       M2: IN SIGNED(N DOWNTO 0);
       SHIFT_MOL: IN STD_LOGIC;
       ClOCK, RESETN ,LDM: IN STD_LOGIC;
       OUTMOL : OUT SIGNED(31 DOWNTO 0));
END MOLT;

ARCHITECTURE BEHAV OF MOLT IS

COMPONENT REGN IS
GENERIC (N: POSITIVE := 33);
PORT (R : IN SIGNED(N DOWNTO 0);
LOAD: IN STD_LOGIC;
ClOCK, RESETN : IN STD_LOGIC;
Q : OUT SIGNED(N DOWNTO 0));
END COMPONENT;

SIGNAL TEMP_M: SIGNED(31 DOWNTO 0);
SIGNAL OUTM: SIGNED(31 DOWNTO 0);


BEGIN
PROCESS (M1,M2,SHIFT_MOL, TEMP_M)
BEGIN
IF (SHIFT_MOL= '0') THEN
TEMP_M <= M1*M2;
OUTM(31 DOWNTO 1) <= TEMP_M(30 DOWNTO 0);
OUTM(0) <= '0'; 
ELSE

OUTM(31) <= M1(15);
OUTM(30 DOWNTO 17) <= M1(13 downto 0);
OUTM(16 downto 0)<=( others => '0');

END IF;
END PROCESS;

REG31:REGN GENERIC MAP (N=>31)
       PORT MAP(R=>OUTM,LOAD=>LDM,RESETN=>RESETN,CLOCK=>CLOCK,Q=>OUTMOL);
 END BEHAV;