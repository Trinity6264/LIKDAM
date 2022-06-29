import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/utils/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
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
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Manage your daily task with Likdam',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 40.0,
                      wordSpacing: 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * .03),
                  const Text(
                    'This smart app that is designed to help you better manage your tasks',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18.0,
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
                  SizedBox(height: size.height * .06),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
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
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
