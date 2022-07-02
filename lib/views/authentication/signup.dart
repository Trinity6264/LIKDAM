import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/logic/auth/new_account/cubit/create_new_user_cubit.dart';
import 'package:bloc_practice/model/user_model.dart';
import 'package:bloc_practice/service/service_locator.dart';
import 'package:bloc_practice/utils/custom_button.dart';
import 'package:bloc_practice/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigation/nav.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController roleController;

  final _service = locator.get<NavigationServices>();

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    roleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    roleController.dispose();
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
              Text(
                'SIGN UP',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: blackColor,
                  fontSize: 40.0,
                  wordSpacing: 4.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * .05),
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/planning.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: size.height * .03),
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
                  CustomTextField(
                    controller: roleController,
                    hintText: 'Role',
                  ),
                  SizedBox(height: size.height * .04),
                  BlocBuilder<CreateNewUserCubit, CreateNewUserState>(
                    builder: (context, state) {
                      if (state is CreateNewUserLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButton(
                        onPressed: () {
                          if (passwordController.text.length < 6) {
                            _service.showBanner(
                                'Password must be more than 5+ char');
                            return;
                          } else if (usernameController.text.length < 3) {
                            _service.showBanner(
                              'Username must be more than 2+ char',
                            );
                            return;
                          } else if (roleController.text.length < 3) {
                            _service.showBanner(
                              'Role must be more than 2+ char',
                            );
                          } else {
                            final userModel = UserModel(
                              username: usernameController.text.trim(),
                              password: passwordController.text.trim(),
                              role: roleController.text.trim(),
                              userJoined: DateTime.now(),
                            );

                            context.read<CreateNewUserCubit>().createUser(
                                  userModel,
                                );
                          }
                        },
                        title: 'Sign Up',
                      );
                    },
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
