import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  String? data;

  void update(String val) {
    data = val;
    emit(CategoryUpdate(text: val));
  }
}
