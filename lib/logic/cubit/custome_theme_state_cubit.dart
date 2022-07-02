import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'custome_theme_state_state.dart';

class CustomeThemeStateCubit extends Cubit<CustomeThemeStateState> {
  CustomeThemeStateCubit() : super(CustomeThemeStateDay(ThemeMode.light));
  bool isDay = true;

  void changeTheme() {
    isDay = !isDay;
    if (isDay) {
      emit(CustomeThemeStateDay(ThemeMode.light));
      return;
    }
    emit(CustomeThemeStateNight(ThemeMode.dark));
  }
}
