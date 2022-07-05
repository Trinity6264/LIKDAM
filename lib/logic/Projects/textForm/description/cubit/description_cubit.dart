import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit() : super(DescriptionInitial());

   String description ='';

  void updateDescription(String val) {
    description = val;
    emit(DescriptionUpdate(description: val));
  }
}
