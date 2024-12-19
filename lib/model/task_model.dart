class TaskModel {
  final int id;
  String title;
  String description;
  DateTime startDate;
  DateTime dueDate;
  bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.startDate,
      required this.dueDate,
      this.isCompleted = false});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'start_date': startDate.toIso8601String(),
        'due_date': dueDate.toIso8601String(),
        'is_completed': isCompleted
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['created_at']),
      dueDate: DateTime.parse(json['due_date']),
      isCompleted: json['is_completed']);
}
