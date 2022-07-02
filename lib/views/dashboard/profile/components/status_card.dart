import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/color_pallet.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key? key,
    required this.size,
    required this.colors,
    required this.length,
    required this.iconData,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final Size size;
  final Color colors;
  final int length;
  final IconData iconData;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.15,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: whiteColor,
                  size: 35,
                ),
                const SizedBox(width: 15.0),
                Text(
                  '$length',
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .015),
            Text(
              title,
              style: const TextStyle(
                color: whiteColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
