import 'package:bloc_practice/views/authentication/splash.dart';
import 'package:bloc_practice/views/dashboard/dashbaord_view.dart';
import 'package:bloc_practice/views/dashboard/home/all_projects.dart';
import 'package:flutter/material.dart';

import '../views/authentication/auth.dart';
import '../views/authentication/login.dart';
import '../views/authentication/signup.dart';

class Routers {
  // Create variables to hold all routes within this app
  static const String splashScreen = '/';
  static const String authScreen = '/auth';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String dashboardScreen = '/dashboard';
  static const String allProjectsScreen = '/allTask';

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (contex) => const SplashScreen());
      case authScreen:
        return MaterialPageRoute(builder: (contex) => const AuthScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (contex) => const LoginScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (contex) => const SignUpScreen());
      case dashboardScreen:
        return MaterialPageRoute(builder: (contex) => const DashBoardScreen());
      case allProjectsScreen:
        return MaterialPageRoute(builder: (contex) => const AllProjects());
      default:
        throw const FormatException('Routes not found');
    }
  }
}
