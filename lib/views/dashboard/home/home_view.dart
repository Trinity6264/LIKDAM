import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

import 'components/category_card.dart';
import 'components/higher_progess_card.dart';
import 'components/project_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBgColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: size.height * .07),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: size.height * .08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Trinity',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_outlined, color: textColor),
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            const HigherProgressCard(),
            SizedBox(height: size.height * .02),
            pageTitle(size, 'Ongoing Projects'),
            const Projectcard(),
            pageTitle(size, 'Category'),
            const CategoryCard(),
          ],
        ),
      ),
    );
  }

  Container pageTitle(Size size, String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: blackColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'View All',
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
