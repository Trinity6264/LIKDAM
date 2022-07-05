import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../locator/service_locator.dart';
import '../../../../service/utils_service.dart';

part 'end_date_state.dart';

class EndDateCubit extends Cubit<EndDateState> {
  EndDateCubit() : super(EndDateInitial());

  final _datePicker = locator.get<UtilsService>();

  Future<void> pickDate(BuildContext context, DateTime dateTime) async {
    final date = await _datePicker.pickDate(context, dateTime);
    if (date != null) {
      emit(EndDatePicked(dateTime: date));
      return;
    }
    return;
  }
}
