import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:bloc_practice/model/project_model.dart';

@Entity()
class UserModel {
  int id;
  @Unique()
  @Index()
  String username;

  String password;
  String role;


  @Backlink()
  final project = ToMany<ProjectModel>();
  @Property(type: PropertyType.date)
  DateTime userJoined;
  UserModel({
    this.id = 0,
    required this.username,
    required this.password,
    required this.role,
    required this.userJoined,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? password,
    String? role,
    DateTime? userJoined,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      userJoined: userJoined ?? this.userJoined,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'userJoined': userJoined.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      userJoined: DateTime.fromMillisecondsSinceEpoch(map['userJoined']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, password: $password, role: $role, userJoined: $userJoined)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.username == username &&
      other.password == password &&
      other.role == role &&
      other.userJoined == userJoined;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      password.hashCode ^
      role.hashCode ^
      userJoined.hashCode;
  }
}
