import 'package:bloc/bloc.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:meta/meta.dart';

import '../../../../navigation/nav.dart';
import '../../../../service/0b_service.dart';
import '../../../../locator/service_locator.dart';
import '../../../../service/shared_prefs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _service = locator.get<ObService>();
  final _nav = locator.get<NavigationServices>();
  final _prefs = locator.get<SharedPrefs>();
  // create new user
  Future<void> loginUser({
    required String username,
    required String password,
    required bool value,
  }) async {
    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 2), () async {
      final res =
          await _service.loginUser(username: username, password: password);
      if (res is int) {
        _prefs.saveLogin(value);
        _nav.replaceStack(Routers.dashboardScreen);
        emit(LoginSuccess(message: res.toString()));
      } else {
        _nav.showBanner(res);
        emit(LoginLoadError(errorMessage: res));
      }
    });
  }
}
