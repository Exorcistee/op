UNIT GetWords;
INTERFACE
  PROCEDURE GetWord(VAR Word: STRING; VAR InFile: TEXT); {������ �����}
  PROCEDURE ToLowerCase(VAR Ch: CHAR); {�������������� � ������� ��������}
IMPLEMENTATION
  PROCEDURE ToLowerCase(VAR Ch: CHAR); {�������������� � ������� �������� ��������� �
                                       ������� ��������, �����, ������}
    BEGIN  
      IF (Ch = 'A') OR (Ch = 'a') THEN Ch := 'a' ELSE
      IF (Ch = 'B') OR (Ch = 'b') THEN Ch := 'b' ELSE
      IF (Ch = 'C') OR (Ch = 'c') THEN Ch := 'c' ELSE
      IF (Ch = 'D') OR (Ch = 'd') THEN Ch := 'd' ELSE
      IF (Ch = 'E') OR (Ch = 'e') THEN Ch := 'e' ELSE
      IF (Ch = 'F') OR (Ch = 'f') THEN Ch := 'f' ELSE
      IF (Ch = 'G') OR (Ch = 'g') THEN Ch := 'g' ELSE
      IF (Ch = 'H') OR (Ch = 'h') THEN Ch := 'h' ELSE
      IF (Ch = 'I') OR (Ch = 'i') THEN Ch := 'i' ELSE
      IF (Ch = 'J') OR (Ch = 'j') THEN Ch := 'j' ELSE
      IF (Ch = 'K') OR (Ch = 'k') THEN Ch := 'k' ELSE
      IF (Ch = 'L') OR (Ch = 'l') THEN Ch := 'l' ELSE
      IF (Ch = 'M') OR (Ch = 'm') THEN Ch := 'm' ELSE
      IF (Ch = 'N') OR (Ch = 'n') THEN Ch := 'n' ELSE
      IF (Ch = 'O') OR (Ch = 'o') THEN Ch := 'o' ELSE
      IF (Ch = 'P') OR (Ch = 'p') THEN Ch := 'p' ELSE
      IF (Ch = 'Q') OR (Ch = 'q') THEN Ch := 'q' ELSE
      IF (Ch = 'R') OR (Ch = 'r') THEN Ch := 'r' ELSE
      IF (Ch = 'S') OR (Ch = 's') THEN Ch := 's' ELSE
      IF (Ch = 'T') OR (Ch = 't') THEN Ch := 't' ELSE
      IF (Ch = 'U') OR (Ch = 'u') THEN Ch := 'u' ELSE
      IF (Ch = 'V') OR (Ch = 'v') THEN Ch := 'v' ELSE
      IF (Ch = 'W') OR (Ch = 'w') THEN Ch := 'w' ELSE
      IF (Ch = 'X') OR (Ch = 'x') THEN Ch := 'x' ELSE
      IF (Ch = 'Y') OR (Ch = 'y') THEN Ch := 'y' ELSE
      IF (Ch = 'Z') OR (Ch = 'z') THEN Ch := 'z' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '�') OR (Ch = '�') THEN Ch := '�' ELSE
      IF (Ch = '-') THEN Ch := '-' ELSE
      IF (Ch = ' ') THEN Ch := ' ' ELSE
        Ch := ' '
  END;
  
  PROCEDURE GetWord(VAR Word: STRING; VAR InFile: TEXT);
  VAR
    I: INTEGER;
    Ch: CHAR;
  BEGIN
    Word := '';
    WHILE (Ch <> ' ') AND NOT(EOLN(InFile))
    DO
     BEGIN
        READ(InFile, Ch);
        ToLowerCase(Ch);
        Word := Word + Ch
      END                 
  END;
    
BEGIN
END.    
