import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/views/dashboard/calendar/calendar_view.dart';
import 'package:bloc_practice/views/dashboard/favourite/favourite_view.dart';
import 'package:bloc_practice/views/dashboard/home/home_view.dart';
import 'package:bloc_practice/views/dashboard/profile/profile_view.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  static const _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.today_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star_outline_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
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
      backgroundColor: whiteBgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add, color: whiteColor),
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
        backgroundColor: whiteColor,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: textColor,
      ),
    );
  }
}
