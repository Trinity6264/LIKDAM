import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/utils/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                color: primaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/timming.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            SizedBox(height: size.height * .05),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Manage your daily task with Likdam',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 30.0,
                      wordSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * .03),
                  Text(
                    'This smart app that is designed to help you better manage your tasks',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * .04),
                  CustomButton(
                    onPressed: () => NavigationServices().navigateTo(
                      Routers.signupScreen,
                    ),
                    title: 'Register',
                  ),
                  SizedBox(height: size.height * .05),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 17.0,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => NavigationServices().navigateTo(
                                  Routers.loginScreen,
                                ),
                          text: 'Sign In',
                          style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .06),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
