import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/views/dashboard/projects/add_project.dart';
import 'package:bloc_practice/views/dashboard/projects/add_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/nav.dart';

class Project extends StatefulWidget {
  Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int currentIndex = 0;

  late final PageController pageCtrl;

  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics();

  @override
  void initState() {
    pageCtrl = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageCtrl.page == 1) {
          pageCtrl.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          locator.get<NavigationServices>().back();
        }
        return false;
      },
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageCtrl,
        children: [
          AddProjects(pageCtrl: pageCtrl),
          AddTask(controller: pageCtrl),
        ],
      ),
    );
  }
}
