import 'dart:ui';

import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/service/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigation/nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = locator<SharedPrefs>();
  final _navService = locator<NavigationServices>();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final userLogin = _prefs.loadLogin() ?? false;
        if (userLogin) {
       return   _navService.replaceStack(Routers.dashboardScreen);
        }else{
          return _navService.replaceStack(Routers.authScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
              tileMode: TileMode.repeated,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/thinking.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            color: primaryColor.withOpacity(.6),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'LIKDAM',
                  style: GoogleFonts.amiri(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 75.0,
                  ),
                ),
                Text(
                  'Play Inc@',
                  style: GoogleFonts.poppins(
                    color: darkBgColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Helps manage your projects on time',
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                Text(
                  'Developed by Trinity',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.adamina(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
