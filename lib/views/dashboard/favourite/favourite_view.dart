import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

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
        title: const Text(
          'Favourite',
          style: TextStyle(
            color: blackColor,
            fontSize: 30.0,
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
                          width: size.width * .2,
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
                        const Text(
                          'Mobile App Design',
                          style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: size.height * .01),
                        Row(
                          children: const [
                            Icon(Icons.access_time_rounded, color: textColor),
                            SizedBox(width: 10),
                            Text(
                              '10:30 - 18:45',
                              style: TextStyle(
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
          },
        ),
      ),
    );
  }
}
