import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'title_state.dart';

class TitleCubit extends Cubit<TitleState> {
  TitleCubit() : super(TitleInitial());
   String data = '';

  void updateText(String val) {
    data = val;
    emit(TitleUpdated(title: val));
  }
}
