import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:bloc_practice/views/dashboard/calendar/calendar_view.dart';
import 'package:bloc_practice/views/dashboard/favourite/favourite_view.dart';
import 'package:bloc_practice/views/dashboard/home/home_view.dart';
import 'package:bloc_practice/views/dashboard/profile/profile_view.dart';
import 'package:bloc_practice/views/dashboard/projects/add_project.dart';
import 'package:bloc_practice/views/dashboard/projects/project.dart';
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
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = await locator.get<ObService>().getAllProject();
          print(data);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: false,
            builder: (_) => Project(),
          );
        },
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
