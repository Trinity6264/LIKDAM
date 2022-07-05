part of 'add_project_cubit.dart';

@immutable
abstract class AddProjectState {}

class AddProjectInitial extends AddProjectState {}

class AddProjectSelectCat extends AddProjectState {
  final Object selectedCat;
  AddProjectSelectCat({required this.selectedCat});
}
