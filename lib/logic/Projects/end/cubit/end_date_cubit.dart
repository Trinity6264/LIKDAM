import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../locator/service_locator.dart';
import '../../../../service/utils_service.dart';

part 'end_date_state.dart';

class EndDateCubit extends Cubit<EndDateState> {
  EndDateCubit() : super(EndDateInitial());

  final _datePicker = locator.get<UtilsService>();

  DateTime? endDate;

  void initialDate(DateTime dateTime) {
    endDate = dateTime.add(const Duration(days: 1));
    emit(EndDatePicked(dateTime: endDate!));
    return;
  }

  Future<void> pickDate(BuildContext context, DateTime dateTime) async {
    final date = await _datePicker.pickDate(context, dateTime);
    endDate = date;
    if (date != null) {
      emit(EndDatePicked(dateTime: date));
      return;
    }
    return;
  }
}
