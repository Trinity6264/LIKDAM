import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:flutter/material.dart';

class AllProjects extends StatefulWidget {
  const AllProjects({Key? key}) : super(key: key);

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBgColor,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: size.height * .07),
            Row(
              children: [
                GestureDetector(
                  onTap: NavigationServices().back,
                  child: Container(
                    width: size.width * .1,
                    height: size.height * .05,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor,
                    ),
                    child: const Icon(Icons.arrow_back_ios, color: blackColor),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'UI Design',
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .03),
            Container(
              width: double.infinity,
              height: size.height * .07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabs(name: 'All', size: size),
                  tabs(name: 'Ongoing', size: size),
                  tabs(name: 'Completed', size: size),
                ],
              ),
            ),
            SizedBox(height: size.height * .03),
            Expanded(
              child: AnimatedList(
                initialItemCount: 10,
                itemBuilder: (_, index, value) {
                  return SizedBox(
                    width: double.infinity,
                    height: size.height * .2,
                    child: Card(
                      color: whiteColor,
                      elevation: 5.0,
                      shadowColor: primaryColor.withOpacity(0.5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: size.width * .02,
                            height: size.height * .045,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                      20,
                                      10,
                                      20,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          'Kamu Mobile Ui',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          'Progress',
                                          style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: size.height * .01),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.calendar_month_rounded,
                                              color: textColor,
                                              size: 20.0,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Jan 16, 2022',
                                              style: TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        width: size.width * .3,
                                        height: size.height * .1,
                                        decoration: BoxDecoration(
                                          color: _currentName == 'All'
                                              ? primaryColor
                                              : _currentName == 'Ongoing'
                                                  ? greenColor
                                                  : lightPink,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle,
                                            color: greenColor,
                                            size: 20.0,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '13 Tasks',
                                            style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _currentName = 'All';

  Widget tabs({required String name, required Size size}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentName = name;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: size.width * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _currentName == name ? primaryColor : whiteColor,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: _currentName == name ? whiteColor : blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
