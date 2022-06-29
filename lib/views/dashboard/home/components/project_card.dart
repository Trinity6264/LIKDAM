import 'package:flutter/material.dart';

import '../../../../constant/color_pallet.dart';

class Projectcard extends StatelessWidget {
  const Projectcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .19,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: size.width * .55,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 3.0,
                shadowColor: primaryColor.withOpacity(0.5),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .015),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Mobile UI Kit',
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '24 Task',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Progress',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '75%',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .015),
                      Stack(
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: 2,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .015),
                      Row(
                        children: const [
                          Icon(
                            Icons.access_time,
                            color: textColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '3 Days left',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
