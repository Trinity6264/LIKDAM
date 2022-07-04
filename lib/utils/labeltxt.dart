import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text labelTxt(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    ),
  );
}
