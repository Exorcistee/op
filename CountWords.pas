PROGRAM CountWords(INPUT, OUTPUT);
USES 
  GetWords;
CONST 
  MaxLength = 1000;
TYPE
  Tree = ^Node;
  Node = RECORD
           Key: STRING;
           Count: INTEGER;
           LLink, RLink: Tree
         END; 
VAR
  InFile, OutFile: TEXT;
  CountWords: INTEGER;
  Root: Tree;

PROCEDURE Insert(VAR Ptr: Tree; Word: STRING);
BEGIN
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.Key := Word;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
    END
  ELSE
    IF Ptr^.Key = Word
    THEN
      Ptr^.Count := Ptr^.Count + 1
    ELSE
      IF Ptr^.Key > Word
      THEN
        Insert(Ptr^.LLink, Word)
      ELSE
        Insert(Ptr^.RLink, Word)
END;

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITELN(Ptr^.Key, ' ', Ptr^.Count);
      PrintTree(Ptr^.RLink);
    END;
END;  {PrintTree}

PROCEDURE Overflow(VAR CountWords: INTEGER);
BEGIN
  IF CountWords > MaxLength
  THEN
    WRITELN('Переполнение. Слов больше чем ', MaxLength)
  ELSE
    WRITELN('Слов в файле: ', CountWords)
END; 
  
PROCEDURE ReadText(VAR InFile: TEXT);
VAR
  Word: STRING;
BEGIN
  Root := NIL;
  CountWords := 0;
  WHILE NOT(EOF(InFile)) AND (CountWords <= MaxLength)
  DO
    BEGIN
      WHILE NOT(EOLN(InFile))
      DO
        BEGIN
          GetWord(Word, InFile);
          IF length(Word) > 0
          THEN
            BEGIN
              Insert(Root, Word);
              CountWords := CountWords + 1
            END
        END;
      READLN(InFile)  
    END;
  PrintTree(Root);
  Overflow(CountWords)    
END;

  
BEGIN
  ASSIGN(OutFile, 'output.txt');
  ASSIGN(InFile, 'inp.txt');
  RESET(InFile);
  REWRITE(OutFile);
  ReadText(InFile);
  CLOSE(OutFile);
  CLOSE(InFile)
END.
