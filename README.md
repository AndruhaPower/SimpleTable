# SimpleTable
Simple Table is a small half-a-day job interview project.

Has Main And Detail ViewControllers.
Main as a TableViewController
Detail as a common UIViewController




task:
###
Необходимо реализовать простейшее приложение, которое будет отображать список случайной длины от 10 до 100 элементов. При тапе по элементу, открывать новый экран с отображением подробной информации об элементе.
Список формируется случайным способом из объектов трех типов:

struct Notice {
  var flightDate: Date?
  var gate: String?
}

class Event {
  var startTime: Date?
  var endTime: Date?
  var name: String!
}

class Move {
  var fromPlace: String?
  var toPlace: String?
  var estimateTime: TimeInterval?
}

Ячейка списка содержит текстовое описание объекта в виде "название" - "детали". На экране деталей - подробная информация в виде полей в зависимости от типа элемента.

###
