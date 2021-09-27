class Task {
  int id;
  String date;
  String task;
  String description;
  bool isDone;

  static List<Task> data = [
    Task(
        id: 0,
        date: "2024-01-10",
        task: "Task1",
        description: "Description1",
        isDone: true),
    Task(
        id: 1,
        date: "2021-01-10",
        task: "Task2",
        description: "Description2",
        isDone: true),
    Task(
        id: 2,
        date: "2022-01-10",
        task: "Task3",
        description: "Description3",
        isDone: false),
    Task(
        id: 3,
        date: "2022-01-10",
        task: "Task4",
        description: "Description4",
        isDone: false),
    Task(
        id: 4,
        date: "2022-01-09",
        task: "Task5",
        description: "Description5",
        isDone: false),
  ];

  Task(
      {required this.id,
      required this.date,
      required this.task,
      required this.description,
      required this.isDone});
}
