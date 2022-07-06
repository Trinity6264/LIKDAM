import 'package:bloc/bloc.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/model/category_model.dart';
import 'package:bloc_practice/model/project_model.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:meta/meta.dart';

import '../../../../../model/task_model.dart';

part 'create_project_state.dart';

class CreateProjectCubit extends Cubit<CreateProjectState> {
  CreateProjectCubit() : super(CreateProjectInitial());
  final _locatorService = locator.get<ObService>();

  void createProject({
    required List<TaskModel> taskModel,
    required ProjectModel projectModel,
    required CategoryModel categoryModel,
  }) async {
    for (int i = 0; i < taskModel.length; i++) {
      if (i != taskModel.length) {
        final id = await _locatorService.createProject(
          projectModel: projectModel,
          categoryModel: categoryModel,
          taskModel: taskModel[i],
        );
        print(id);
        if (i == taskModel.length - 1) {
          print('Y3 Wie');
          return;
        }
        continue;
      } else {
        print('Play');
        return;
      }
    }

    print('object');
  }
}
