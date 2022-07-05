import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit() : super(DescriptionInitial());

  void updateDescription(String val) {
    emit(DescriptionUpdate(description: val));
  }
}
