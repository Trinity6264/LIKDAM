import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/utils/custom_button.dart';
import 'package:bloc_practice/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth/login/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late FocusNode usernameNode;
  late TextEditingController passwordController;
  late FocusNode passwordNode;

  final _service = locator.get<NavigationServices>();

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
  }

  bool isKeepLogin = true;

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
                'LOGIN',
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
                    focusNode: usernameNode,
                    controller: usernameController,
                    hintText: 'Username',
                  ),
                  SizedBox(height: size.height * .04),
                  CustomTextField(
                    focusNode: passwordNode,
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  SizedBox(height: size.height * .015),
                  Row(
                    children: [
                      Checkbox(
                        value: isKeepLogin,
                        activeColor: primaryColor,
                        onChanged: (val) {
                          setState(() {
                            isKeepLogin = !isKeepLogin;
                          });
                        },
                      ),
                      const Text(
                        'Keep me login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomButton(
                        onPressed: () {
                          passwordNode.unfocus();
                          usernameNode.unfocus();
                          if (passwordController.text.length < 6) {
                            _service.showBanner(
                                'Password must be more than 5+ char');
                            return;
                          } else if (usernameController.text.length < 3) {
                            _service.showBanner(
                              'Username must be more than 2+ char',
                            );
                            return;
                          }
                          context.read<LoginCubit>().loginUser(
                                username: usernameController.text.trim(),
                                password: passwordController.text.trim(),
                                value: isKeepLogin,
                              );
                        },
                        title: 'Login',
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
