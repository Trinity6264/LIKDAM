import 'package:bloc/bloc.dart';
import 'package:bloc_practice/model/user_model.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:bloc_practice/service/service_locator.dart';
import 'package:bloc_practice/service/shared_prefs.dart';
import 'package:meta/meta.dart';

part 'create_new_user_state.dart';

class CreateNewUserCubit extends Cubit<CreateNewUserState> {
  CreateNewUserCubit() : super(CreateNewUserInitial());
  final _service = locator.get<ObService>();
  final _nav = locator.get<NavigationServices>();
  final _prefs = locator.get<SharedPrefs>();
  // create new user
  Future<void> createUser(UserModel userModel) async {
    emit(CreateNewUserLoading());
    Future.delayed(const Duration(seconds: 2), () async {
      final res = await _service.createNewUser(userModel: userModel);
      if (res is int) {
        _prefs.savedUserId(res);
        emit(CreateNewUserSuccess(userId: res));
      } else {
        _nav.showBanner(res);
        print(res);
        emit(CreateNewUserError(errormessage: res));
      }
    });
  }
}
