import 'package:flutter/material.dart';

class UtilsService{


  Future<DateTime?> pickDate(BuildContext context,DateTime date) {
    return showDatePicker(
      context: context,
      keyboardType: TextInputType.datetime,
      helpText: 'LIKDAM',
      initialDate: date,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
  }
}