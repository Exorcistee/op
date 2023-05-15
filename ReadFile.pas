UNIT GetWords;
INTERFACE
  PROCEDURE GetWord(VAR Word: STRING; VAR InFile: TEXT); {Чтение файла}
  PROCEDURE ToLowerCase(VAR Ch: CHAR); {Преобразование к нижнему регистру}
IMPLEMENTATION
  PROCEDURE ToLowerCase(VAR Ch: CHAR); {Преобразование к нижнему регистру латинских и
                                       русских символов, иначе, пробел}
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
      IF (Ch = 'А') OR (Ch = 'а') THEN Ch := 'а' ELSE
      IF (Ch = 'Б') OR (Ch = 'б') THEN Ch := 'б' ELSE
      IF (Ch = 'В') OR (Ch = 'в') THEN Ch := 'в' ELSE
      IF (Ch = 'Г') OR (Ch = 'г') THEN Ch := 'г' ELSE
      IF (Ch = 'Д') OR (Ch = 'д') THEN Ch := 'д' ELSE
      IF (Ch = 'Е') OR (Ch = 'е') THEN Ch := 'е' ELSE
      IF (Ch = 'Ё') OR (Ch = 'ё') THEN Ch := 'ё' ELSE
      IF (Ch = 'Ж') OR (Ch = 'ж') THEN Ch := 'ж' ELSE
      IF (Ch = 'З') OR (Ch = 'з') THEN Ch := 'з' ELSE
      IF (Ch = 'И') OR (Ch = 'и') THEN Ch := 'и' ELSE
      IF (Ch = 'Й') OR (Ch = 'й') THEN Ch := 'й' ELSE
      IF (Ch = 'К') OR (Ch = 'к') THEN Ch := 'к' ELSE
      IF (Ch = 'Л') OR (Ch = 'л') THEN Ch := 'л' ELSE
      IF (Ch = 'М') OR (Ch = 'м') THEN Ch := 'м' ELSE
      IF (Ch = 'Н') OR (Ch = 'н') THEN Ch := 'н' ELSE
      IF (Ch = 'О') OR (Ch = 'о') THEN Ch := 'о' ELSE
      IF (Ch = 'П') OR (Ch = 'п') THEN Ch := 'п' ELSE
      IF (Ch = 'Р') OR (Ch = 'р') THEN Ch := 'р' ELSE
      IF (Ch = 'С') OR (Ch = 'с') THEN Ch := 'с' ELSE
      IF (Ch = 'Т') OR (Ch = 'т') THEN Ch := 'т' ELSE
      IF (Ch = 'У') OR (Ch = 'у') THEN Ch := 'у' ELSE
      IF (Ch = 'Ф') OR (Ch = 'ф') THEN Ch := 'ф' ELSE
      IF (Ch = 'Х') OR (Ch = 'х') THEN Ch := 'х' ELSE
      IF (Ch = 'Ц') OR (Ch = 'ц') THEN Ch := 'ц' ELSE
      IF (Ch = 'Ч') OR (Ch = 'ч') THEN Ch := 'ч' ELSE
      IF (Ch = 'Ш') OR (Ch = 'ш') THEN Ch := 'ш' ELSE
      IF (Ch = 'Щ') OR (Ch = 'щ') THEN Ch := 'щ' ELSE
      IF (Ch = 'Ъ') OR (Ch = 'ъ') THEN Ch := 'ъ' ELSE
      IF (Ch = 'Ы') OR (Ch = 'ы') THEN Ch := 'ы' ELSE
      IF (Ch = 'Э') OR (Ch = 'э') THEN Ch := 'э' ELSE
      IF (Ch = 'Ю') OR (Ch = 'ю') THEN Ch := 'ю' ELSE
      IF (Ch = 'Я') OR (Ch = 'я') THEN Ch := 'я' ELSE
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
