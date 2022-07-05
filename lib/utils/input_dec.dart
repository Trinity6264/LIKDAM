import 'package:flutter/material.dart';

import '../constant/color_pallet.dart';

InputDecoration inputDec = const InputDecoration(
  border: InputBorder.none,
  enabled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: textColor,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: cancelColor,
    ),
  ),
);
