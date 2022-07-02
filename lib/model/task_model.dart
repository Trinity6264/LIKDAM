import 'dart:convert';

import 'package:bloc_practice/model/project_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  int id;
  String taskContent;
  bool isDone;

  final project = ToOne<ProjectModel>();
  TaskModel({
    this.id = 0,
    required this.taskContent,
    required this.isDone,
  });

  TaskModel copyWith({
    int? id,
    String? taskContent,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskContent: taskContent ?? this.taskContent,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskContent': taskContent,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      taskContent: map['taskContent'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TaskModel(id: $id, taskContent: $taskContent, isDone: $isDone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.taskContent == taskContent &&
        other.isDone == isDone;
  }

  @override
  int get hashCode => id.hashCode ^ taskContent.hashCode ^ isDone.hashCode;
}
