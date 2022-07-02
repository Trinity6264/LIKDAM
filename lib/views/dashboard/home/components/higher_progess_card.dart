import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/color_pallet.dart';

class HigherProgressCard extends StatelessWidget {
  const HigherProgressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * .2,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Great, your progress is almost done!!',
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: size.height * .02),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: whiteColor,
                  ),
                  child: Text(
                    'View Project',
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GFProgressBar(
              backgroundColor: whiteColor.withOpacity(.5),
              progressBarColor: whiteColor,
              progressHeadType: GFProgressHeadType.circular,
              type: GFProgressType.circular,
              percentage: 0.72,
              radius: 100.0,
              circleWidth: 12,
              autoLive: true,
              animation: true,
              child: Text(
                '72%',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
