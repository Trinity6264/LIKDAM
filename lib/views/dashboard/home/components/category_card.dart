import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:flutter/material.dart';

import '../../../../constant/color_pallet.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .19,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => NavigationServices().navigateTo(
                Routers.allProjectsScreen,
              ),
              child: Container(
                width: size.width * .45,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3.0,
                  shadowColor: primaryColor.withOpacity(0.5),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: size.height * .015),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'UI Design',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '20 Projects',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * .015),
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.width * 0.2,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: lightPink,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: lightPink.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '3/7',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * .015),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
