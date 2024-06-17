import 'dart:convert';

// Functions to parse and convert TaskModel from/to JSON
TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));
String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  List<Task> tasks;

  TaskModel({
    required this.tasks,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  int id;
  String title;
  String description;
  DateTime? dueDate;
  String status;
  int userId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.dueDate,
    required this.status,
    required this.userId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        status: json["status"],
        userId: json["user_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "due_date": dueDate?.toIso8601String(),
        "status": status,
        "user_id": userId,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
