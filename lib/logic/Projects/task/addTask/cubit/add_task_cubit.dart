import 'package:bloc/bloc.dart';
import 'package:bloc_practice/model/task_model.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  List<TaskModel> allTask = [];
  void taskUpdate({required bool isAdd, required String task}) {
    if (isAdd) {
      final taskModel = TaskModel(taskContent: task, isDone: false);
      allTask.add(taskModel);
    } else {
      final taskModel = TaskModel(taskContent: task, isDone: false);
      allTask.remove(taskModel);
    }
    emit(AddTaskUpdate(listofTask: allTask));
  }
}
