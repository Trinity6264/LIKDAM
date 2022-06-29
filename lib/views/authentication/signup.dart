import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/utils/custom_button.dart';
import 'package:bloc_practice/utils/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../navigation/nav.dart';
import '../../routes/router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .1),
              const Text(
                'SIGN UP',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 40.0,
                  wordSpacing: 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * .05),
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/planning.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: size.height * .05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: usernameController,
                    hintText: 'Username',
                  ),
                  SizedBox(height: size.height * .04),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  SizedBox(height: size.height * .04),
                  CustomButton(
                    onPressed: () => NavigationServices().replaceStack(
                      Routers.dashboardScreen,
                    ),
                    title: 'Sign Up',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
