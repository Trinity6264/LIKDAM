part of 'project_card_cubit.dart';

@immutable
abstract class ProjectCardState {}

class ProjectCardInitial extends ProjectCardState {}
class ProjectCardLoading extends ProjectCardState {}

class ProjectCardLoaded extends ProjectCardState {
  final List<ProjectModel> projectModel;
  ProjectCardLoaded({required this.projectModel});
}

class ProjectCardEmpty extends ProjectCardState {
  final String message;
  ProjectCardEmpty({required this.message});
}
