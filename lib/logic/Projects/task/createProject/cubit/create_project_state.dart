part of 'create_project_cubit.dart';

@immutable
abstract class CreateProjectState {}

class CreateProjectInitial extends CreateProjectState {}

class CreateProjectLoading extends CreateProjectState {}

class CreateProjectDone extends CreateProjectState {
  final String message;
  CreateProjectDone({required this.message});
}

class CreateProjectFailed extends CreateProjectState {
  final String message;
  CreateProjectFailed({required this.message});
}
