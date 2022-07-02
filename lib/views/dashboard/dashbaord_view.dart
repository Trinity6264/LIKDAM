import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/views/dashboard/calendar/calendar_view.dart';
import 'package:bloc_practice/views/dashboard/favourite/favourite_view.dart';
import 'package:bloc_practice/views/dashboard/home/home_view.dart';
import 'package:bloc_practice/views/dashboard/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  static const _tabs = [
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.house),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.calendar),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.star),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.user),
      label: '',
    ),
  ];

  int currentScreen = 0;

  static const _views = [
    HomeView(),
    CalendarView(),
    FavouriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(FontAwesomeIcons.plus, color: whiteColor),
      ),
      body: IndexedStack(
        index: currentScreen,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        items: _tabs,
        currentIndex: currentScreen,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: textColor,
      ),
    );
  }
}
