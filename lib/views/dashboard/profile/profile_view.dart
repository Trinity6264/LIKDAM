import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

import 'components/status_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static const colors = [
    greenColor,
    primaryColor,
    cancelColor,
    pendingColor,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBgColor,
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(
          color: blackColor,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteBgColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: blackColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: whiteColor,
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  onTap: () {
                    debugPrint('Whip');
                  },
                  child: const Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * .02),
            Container(
              width: size.width * 2,
              height: size.height * .12,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
            SizedBox(height: size.height * .02),
            const Text(
              'Trinity',
              style: TextStyle(
                color: blackColor,
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height * .01),
            const Text(
              'Mobile Developer',
              style: TextStyle(
                color: textColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height * .03),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * .02),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project overview',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatusCard(
                        size: size,
                        colors: greenColor,
                        length: 24,
                        iconData: Icons.done_all_outlined,
                        onPressed: () {},
                        title: 'Completed Projects',
                      ),
                      StatusCard(
                        size: size,
                        colors: primaryColor,
                        length: 16,
                        iconData: Icons.access_time_rounded,
                        onPressed: () {},
                        title: 'Ongoing Projects',
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatusCard(
                        size: size,
                        colors: cancelColor,
                        length: 50,
                        iconData: Icons.cancel_outlined,
                        onPressed: () {},
                        title: 'Canceled Projects',
                      ),
                      StatusCard(
                        size: size,
                        colors: pendingColor,
                        length: 12,
                        iconData: Icons.stacked_line_chart,
                        onPressed: () {},
                        title: 'Pending Projects',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
