import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constant/color_pallet.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    Key? key,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  final DateTime date;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: textColor.withOpacity(.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              DateFormat.yMMMMEEEEd().format(date),
              style: GoogleFonts.poppins(
                color: primaryColor,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.calendar_month,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
