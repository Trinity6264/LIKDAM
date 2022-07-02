part of 'custome_theme_state_cubit.dart';

@immutable
abstract class CustomeThemeStateState {}

class CustomeThemeStateDay extends CustomeThemeStateState {
  final ThemeMode themeMode;

  CustomeThemeStateDay(this.themeMode);
}

class CustomeThemeStateNight extends CustomeThemeStateState {
  final ThemeMode themeMode;

  CustomeThemeStateNight(this.themeMode);
}
