class TaskModel {
  final int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime dueDate;
  bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.dueDate,
      this.isCompleted = false});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'dueDate': dueDate.toIso8601String(),
        'isCompleted': isCompleted
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      dueDate: DateTime.parse(json['dueDAte']));
}
