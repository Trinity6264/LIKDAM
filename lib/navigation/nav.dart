import 'dart:async';

import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

// ! This two Global keys will help us manuplate the navigation and scaffoldstate
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffolKey =
    GlobalKey<ScaffoldMessengerState>();

class NavigationServices {
  //? creating a navigations methods

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> replaceStack(String routeName) {
    return navigationKey.currentState!.popAndPushNamed(routeName);
  }

  void back() {
    return navigationKey.currentState!.pop();
  }

  FutureOr<dynamic> showSnackBar(String message) {
    scaffolKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: blackColor,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () => scaffolKey.currentState!.hideCurrentSnackBar(),
    );
  }

  FutureOr<dynamic> showBanner(String message) {
    scaffolKey.currentState!.showMaterialBanner(
      MaterialBanner(
        content: Text(
          message,
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: primaryColor,
        overflowAlignment: OverflowBarAlignment.start,
        elevation: 5.0,
        leading: const Icon(Icons.info, color: whiteColor),
        actions: [
          Container(),
        ],
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => scaffolKey.currentState!.hideCurrentMaterialBanner(),
    );
  }
}
