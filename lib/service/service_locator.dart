import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:bloc_practice/service/shared_prefs.dart';
import 'package:bloc_practice/theme/custom_theme.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

// Registering all services here
void setup() {
  locator.registerLazySingleton<NavigationServices>(
    () => NavigationServices(),
  );
  locator.registerLazySingleton<CustomTheme>(
    () => CustomTheme(),
  );
  locator.registerLazySingleton<ObService>(
    () => ObService(),
  );
  locator.registerLazySingleton<SharedPrefs>(
    () => SharedPrefs(),
  );
}
