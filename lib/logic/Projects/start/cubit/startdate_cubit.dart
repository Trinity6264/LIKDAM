import 'package:bloc/bloc.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/service/utils_service.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'startdate_state.dart';

class StartdateCubit extends Cubit<StartdateState> {
  StartdateCubit() : super(StartdateInitial());
  final _datePicker = locator.get<UtilsService>();

  Future<void> pickDate(BuildContext context, DateTime dateTime) async {
    final date = await _datePicker.pickDate(context,dateTime);
    if (date != null) {
      emit(Startdatedone(date: date));
      return;
    }
    return;
  }
}
