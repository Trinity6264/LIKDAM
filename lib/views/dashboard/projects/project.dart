import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/views/dashboard/projects/add_project.dart';
import 'package:flutter/material.dart';

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
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageCtrl,
      children: [
        AddProjects(pageCtrl: pageCtrl),
        Container(color: greenColor),
      ],
    );
  }
}
