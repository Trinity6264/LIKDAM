import 'package:flutter/material.dart';

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
                const Text(
                  'Great, your progress is almost done!!',
                  style: TextStyle(
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
                  child: const Text(
                    'View Project',
                    style: TextStyle(
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
            child: Container(
              decoration: const BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
