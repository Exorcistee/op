UNIT InsertionSort2;

INTERFACE 

{�������� ������ ��������� �����, ������� �������� ���� (�����), 
 ���������� ��� ��������� � ���� � ������ �� ��������� ����}
TYPE
  NodePtr = ^Node;
  Node = RECORD
           Key: STRING;
           Count: INTEGER;
           Next: NodePtr
         END;
VAR {���������� ������ �� ����������: ��� ���������: ��� ��� ������������ ���������� �������� � ������������}
  FirstPtr, NewPtr: NodePtr; {��������� ���������� FirstPtr � NewPtr ���� NodePtr}
  
PROCEDURE AddElement(VAR FirstPtr: NodePtr; Data: STRING); {��������� ����� �������� � ��������� ������}
PROCEDURE PrintList(VAR FirstPtr: NodePtr); {������� ���������� ������ �� �����}
PROCEDURE ClearList(VAR FirstPtr: NodePtr); {������� ������}
PROCEDURE CountWords; {������� ���������� ���������� ���� � ����� � ������� ��������� �� �����. 
���� ���������� ���� � ����� ��������� ���������� ��������, �� ��������� ��������� �� ������}

IMPLEMENTATION 

CONST
  MaxWords = 1000; {���������� �� ������������ ���������� �������� ����}

VAR
  Counter: INTEGER;

{��������� ����� ������� � ��������� ������, ������� ������ ���������� ����� �� �����, 
� ����������� ������� ���������� ���� � ������}  
PROCEDURE AddElement(VAR FirstPtr: NodePtr; Data: STRING);
VAR
  Curr, Prev, NewPtr: NodePtr;
BEGIN
  IF Counter < MaxWords {�������� �� ������������ ���������� ���������� ����}
  THEN
    BEGIN
      New(NewPtr); {��������� ����� ���� ������, ����������� ��� ���� 'Key', 'Count', � 'Next'}
      NewPtr^.Key := Data; 
      NewPtr^.Count := 1;
      NewPtr^.Next := NIL;
      IF (FirstPtr = NIL) {���� ������ ������, �� 'NewPtr' ���������� ������ ��������� ������, 
                          � ������� 'Counter' ������������� �� 1.}
      THEN
        BEGIN
          FirstPtr := NewPtr;
          Counter := Counter + 1
        END
      ELSE {���� ������ �� ������, �� ��������� ������� �������, � ������� ����� �������� 
      ����� ���� NewPtr, ��� ����� ������ ��������� ��������������� �� �������� ������.}
        BEGIN
          Prev := NIL;
          Curr := FirstPtr;
          {���������� ����� �������� ���� Curr � ���� ������ ���� NewPtr}
          WHILE (Curr <> NIL) AND (Curr^.Key < NewPtr^.Key) {���� Curr ������ NewPtr, 
          �� ��������� ��������� � ���������� ���� Curr � ���������� ���������}
          DO
            BEGIN
              Prev := Curr;
              Curr := Curr^.Next
            END;
          IF (Curr <> NIL) AND (Curr^.Key = NewPtr^.Key) {���� ����� Curr � NewPtr �����, 
          �� ��������� ����������� �������� Count ��� �������� ���� Curr.}
          THEN
            Curr^.Count := Curr^.Count + 1
          ELSE {���� Curr ������ NewPtr, �� ������� ����������� ����� Curr}
            BEGIN
              NewPtr^.Next := Curr;
              IF (Prev = NIL) 
              THEN
                FirstPtr := NewPtr
              ELSE
                Prev^.Next := NewPtr;
              Counter := Counter + 1
            END
        END
    END
END;

PROCEDURE PrintList(VAR FirstPtr: NodePtr); {������� ���������� ������ �� �����}
BEGIN
  NewPtr := FirstPtr; {� ��������� ���������� 'NewPtr' ���������� ������ ������� ������}
  WHILE (NewPtr <> NIL) {�������� ������� ������� ����� � ������}
  DO
    BEGIN
      WRITELN(NewPtr^.Key, ' ', NewPtr^.Count); {����� ����� � �������� ��������� �����}
      NewPtr := NewPtr^.Next {������� � ���������� ���� ������}
    END
END;

PROCEDURE ClearList(VAR FirstPtr: NodePtr); {����������� ������, ���������� ��� 
������� ���� ������, ������ ���� ������}
VAR
  Curr: NodePtr; {E�������� �� ������� ����}
BEGIN
  WHILE (FirstPtr <> NIL) {���������� �� ������, ���������� ������ ��� 
  �������� ����, ���� ������ ���� �� ������ ����� 'NIL'}
  DO
    BEGIN
      Curr := FirstPtr;
      FirstPtr := FirstPtr^.Next;
      DISPOSE(Curr)
    END
END;                                         

PROCEDURE CountWords; {������� ���������� ���������� ���� � ����� � ������� ��������� �� �����. 
���� ���������� ���� � ����� ��������� MaxNumberOfWords, �� ��������� ��������� �� ������}
BEGIN
  IF Counter < MaxWords
  THEN
    WRITE('���������� ���� � �����: ', Counter)
  ELSE
    WRITE('������������. ������������ ���������� ����: ', MaxWords)
END;

BEGIN
  Counter := 0 {�������� ������� ����, ������������� ��� ��������� "0"}
END.
