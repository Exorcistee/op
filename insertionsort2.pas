UNIT InsertionSort2;

INTERFACE 

{Создание списка связанных узлов, которые содержат ключ (слово), 
 количество его вхождений в файл и ссылку на следующий узел}
TYPE
  NodePtr = ^Node;
  Node = RECORD
           Key: STRING;
           Count: INTEGER;
           Next: NodePtr
         END;
VAR {переменные убрать из интерфейса: это внутрянка: так как польщователю достаточно работать с проценлурами}
  FirstPtr, NewPtr: NodePtr; {Объявляем переменные FirstPtr и NewPtr типа NodePtr}
  
PROCEDURE AddElement(VAR FirstPtr: NodePtr; Data: STRING); {Добавляет новые элементы в связанный список}
PROCEDURE PrintList(VAR FirstPtr: NodePtr); {Выводит содержимое списка на экран}
PROCEDURE ClearList(VAR FirstPtr: NodePtr); {Очищают список}
PROCEDURE CountWords; {Считает количество уникальных слов в файле и выводит результат на экран. 
Если количество слов в файле превышает допустимое значение, то выводится сообщение об ошибке}

IMPLEMENTATION 

CONST
  MaxWords = 1000; {Переменная на максимальное количество вводимых слов}

VAR
  Counter: INTEGER;

{Добавляет новый элемент в связанный список, который хранит уникальные слова из файла, 
и увеличивает счетчик количества слов в списке}  
PROCEDURE AddElement(VAR FirstPtr: NodePtr; Data: STRING);
VAR
  Curr, Prev, NewPtr: NodePtr;
BEGIN
  IF Counter < MaxWords {проверка на максимальнон допустимое количество слов}
  THEN
    BEGIN
      New(NewPtr); {Создается новый узел списка, заполняются его поля 'Key', 'Count', и 'Next'}
      NewPtr^.Key := Data; 
      NewPtr^.Count := 1;
      NewPtr^.Next := NIL;
      IF (FirstPtr = NIL) {Если список пустой, то 'NewPtr' становится первым элементом списка, 
                          а счетчик 'Counter' увеличивается на 1.}
      THEN
        BEGIN
          FirstPtr := NewPtr;
          Counter := Counter + 1
        END
      ELSE {Если список не пустой, то процедура находит позицию, в которую нужно вставить 
      новый узел NewPtr, так чтобы список оставался отсортированным по алфавиту ключей.}
        BEGIN
          Prev := NIL;
          Curr := FirstPtr;
          {сравнивает ключи текущего узла Curr и ключ нового узла NewPtr}
          WHILE (Curr <> NIL) AND (Curr^.Key < NewPtr^.Key) {Если Curr меньше NewPtr, 
          то процедура переходит к следующему узлу Curr и продолжает сравнение}
          DO
            BEGIN
              Prev := Curr;
              Curr := Curr^.Next
            END;
          IF (Curr <> NIL) AND (Curr^.Key = NewPtr^.Key) {Если ключи Curr и NewPtr равны, 
          то процедура увеличивает значение Count для текущего узла Curr.}
          THEN
            Curr^.Count := Curr^.Count + 1
          ELSE {Если Curr больше NewPtr, то вставка выполняется перед Curr}
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

PROCEDURE PrintList(VAR FirstPtr: NodePtr); {Выводит содержимое списка на экран}
BEGIN
  NewPtr := FirstPtr; {В локальную переменную 'NewPtr' записываем первый элемент списка}
  WHILE (NewPtr <> NIL) {Проверка условия наличия узлов в списке}
  DO
    BEGIN
      WRITELN(NewPtr^.Key, ' ', NewPtr^.Count); {Вывод ключа и счётчика вхождений слова}
      NewPtr := NewPtr^.Next {Переход к следующему узлу списка}
    END
END;

PROCEDURE ClearList(VAR FirstPtr: NodePtr); {Освобождает память, выделенную для 
каждого узла списка, очищая весь список}
VAR
  Curr: NodePtr; {Eказатель на текущий узел}
BEGIN
  WHILE (FirstPtr <> NIL) {Проходимся по списку, освобождая память для 
  текущего узла, пока первый узел не станет равен 'NIL'}
  DO
    BEGIN
      Curr := FirstPtr;
      FirstPtr := FirstPtr^.Next;
      DISPOSE(Curr)
    END
END;                                         

PROCEDURE CountWords; {Считает количество уникальных слов в файле и выводит результат на экран. 
Если количество слов в файле превышает MaxNumberOfWords, то выводится сообщение об ошибке}
BEGIN
  IF Counter < MaxWords
  THEN
    WRITE('Количество слов в файле: ', Counter)
  ELSE
    WRITE('Переполнение. Максимальное количество слов: ', MaxWords)
END;

BEGIN
  Counter := 0 {обнуляем счетчик слов, инициализируя его значением "0"}
END.
