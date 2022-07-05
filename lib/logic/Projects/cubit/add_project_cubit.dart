import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(AddProjectInitial());
  Object? data;
  void selectCategory(Object val) {
    data = val;
    emit(AddProjectSelectCat(selectedCat: val));
  }
}
