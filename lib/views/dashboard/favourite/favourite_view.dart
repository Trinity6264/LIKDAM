import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteBgColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Favourite',
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const FavouriteCard();
          },
        ),
      ),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    Key? key,
    
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .15,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: size.width * .03,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(width: size.width * .07),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * .23,
                  height: size.height * .028,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Center(
                    child: Text(
                      'On-progress',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * .01),
                Text(
                  'Mobile App Design',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: size.height * .01),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clock,
                      color: textColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '10:30 - 18:45',
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
