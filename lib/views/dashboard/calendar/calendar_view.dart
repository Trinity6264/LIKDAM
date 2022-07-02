import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/utils/animated_calender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../favourite/favourite_view.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: whiteBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteBgColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Schedules',
          style: GoogleFonts.poppins(
            fontSize: 30.0,
            color: blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * .1,
              child: Center(
                child: AnimatedHorizontalCalendar(onChanged: (val) {}),
              ),
            ),
            SizedBox(height: size.height * .02),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const FavouriteCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
