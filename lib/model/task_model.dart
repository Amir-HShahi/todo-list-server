class TaskModel {
  final int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime dueDate;
  bool isCompleted = false;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.dueDate});
}
