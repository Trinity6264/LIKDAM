part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskUpdate extends AddTaskState {
  List<TaskModel> listofTask;
  AddTaskUpdate({required this.listofTask});
}
