import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:bloc_practice/model/category_model.dart';
import 'package:bloc_practice/model/task_model.dart';
import 'package:bloc_practice/model/user_model.dart';

@Entity()
class ProjectModel {
  int id;
  String projectTitle;
  String projectDescription;
  @Property(type: PropertyType.date)
  DateTime projectStart;
  @Property(type: PropertyType.date)
  DateTime projectEnd;
  @Property(type: PropertyType.date)
  DateTime projectUpdate;
  bool isCancel;
  bool isfavourite;

// Relation
  final user = ToOne<UserModel>();
  final category = ToOne<CategoryModel>();
  
  @Backlink()
  final task = ToMany<TaskModel>();
  ProjectModel({
    this.id = 0,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectStart,
    required this.projectEnd,
    required this.projectUpdate,
    required this.isCancel,
    required this.isfavourite,
  });

  ProjectModel copyWith({
    int? id,
    String? projectTitle,
    String? projectDescription,
    DateTime? projectStart,
    DateTime? projectEnd,
    DateTime? projectUpdate,
    bool? isCancel,
    bool? isfavourite,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      projectTitle: projectTitle ?? this.projectTitle,
      projectDescription: projectDescription ?? this.projectDescription,
      projectStart: projectStart ?? this.projectStart,
      projectEnd: projectEnd ?? this.projectEnd,
      projectUpdate: projectUpdate ?? this.projectUpdate,
      isCancel: isCancel ?? this.isCancel,
      isfavourite: isfavourite ?? this.isfavourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectTitle': projectTitle,
      'projectDescription': projectDescription,
      'projectStart': projectStart.millisecondsSinceEpoch,
      'projectEnd': projectEnd.millisecondsSinceEpoch,
      'projectUpdate': projectUpdate.millisecondsSinceEpoch,
      'isCancel': isCancel,
      'isfavourite': isfavourite,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id']?.toInt() ?? 0,
      projectTitle: map['projectTitle'] ?? '',
      projectDescription: map['projectDescription'] ?? '',
      projectStart: DateTime.fromMillisecondsSinceEpoch(map['projectStart']),
      projectEnd: DateTime.fromMillisecondsSinceEpoch(map['projectEnd']),
      projectUpdate: DateTime.fromMillisecondsSinceEpoch(map['projectUpdate']),
      isCancel: map['isCancel'] ?? false,
      isfavourite: map['isfavourite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectModel(id: $id, projectTitle: $projectTitle, projectDescription: $projectDescription, projectStart: $projectStart, projectEnd: $projectEnd, projectUpdate: $projectUpdate, isCancel: $isCancel, isfavourite: $isfavourite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProjectModel &&
      other.id == id &&
      other.projectTitle == projectTitle &&
      other.projectDescription == projectDescription &&
      other.projectStart == projectStart &&
      other.projectEnd == projectEnd &&
      other.projectUpdate == projectUpdate &&
      other.isCancel == isCancel &&
      other.isfavourite == isfavourite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      projectTitle.hashCode ^
      projectDescription.hashCode ^
      projectStart.hashCode ^
      projectEnd.hashCode ^
      projectUpdate.hashCode ^
      isCancel.hashCode ^
      isfavourite.hashCode;
  }
}
