import 'package:bloc/bloc.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/model/project_model.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:meta/meta.dart';

part 'project_card_state.dart';

class ProjectCardCubit extends Cubit<ProjectCardState> {
  ProjectCardCubit() : super(ProjectCardInitial());
  final _serviceLocator = locator.get<NavigationServices>();
  final _service = locator.get<ObService>();

  Stream<List<ProjectModel>> loadProjectData() async* {
    emit(ProjectCardLoading());
    final data = _service.getAllProject();

    yield* data;
  }
}
