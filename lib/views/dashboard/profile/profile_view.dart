import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/logic/cubit/custome_theme_state_cubit.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../navigation/nav.dart';
import '../../../service/shared_prefs.dart';
import 'components/status_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static final _navService = locator<NavigationServices>();
  static final _prefs = locator<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteBgColor,
        actionsIconTheme: const IconThemeData(
          color: blackColor,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CustomeThemeStateCubit>().changeTheme();
            },
            icon: FaIcon(
              !context.watch<CustomeThemeStateCubit>().isDay
                  ? Icons.sunny
                  : FontAwesomeIcons.moon,
            ),
          ),
          PopupMenuButton(
            color: whiteColor,
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  onTap: () async {
                    await _prefs.clear().then(
                      (value) async {
                        Future.delayed(
                          const Duration(),
                          () async {
                            _navService.showBanner('Logout successfully');
                            return await _navService
                                .replaceStack(Routers.authScreen);
                          },
                        );
                      },
                    );
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
            Text(
              'Trinity',
              style: GoogleFonts.poppins(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height * .01),
            Text(
              'Mobile Developer',
              style: GoogleFonts.poppins(
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(
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
                  Text(
                    'Project overview',
                    style: GoogleFonts.poppins(
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
                        iconData: FontAwesomeIcons.wifi,
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
                        iconData: FontAwesomeIcons.ban,
                        onPressed: () {},
                        title: 'Canceled Projects',
                      ),
                      StatusCard(
                        size: size,
                        colors: pendingColor,
                        length: 12,
                        iconData: FontAwesomeIcons.circleChevronDown,
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
