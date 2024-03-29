import 'package:bloc_practice/logic/home/projectcard/cubit/project_card_cubit.dart';
import 'package:bloc_practice/model/project_model.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant/color_pallet.dart';
import '../../../../navigation/nav.dart';
import '../../../../utils/labeltxt.dart';

class Projectcard extends StatelessWidget {
  const Projectcard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .19,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: StreamBuilder<List<ProjectModel>>(
          stream: BlocProvider.of<ProjectCardCubit>(context).loadProjectData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator()
              );
            } else if (snapshot.hasData) {
              final project = snapshot.data;
              return ListView.builder(
                  itemCount: project?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = project?[index];
                    return GestureDetector(
                      onTap: () => locator.get<NavigationServices>().navigateTo(
                            Routers.projectScreen,
                          ),
                      child: Container(
                        width: size.width * .55,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 3.0,
                          shadowColor: primaryColor.withOpacity(0.5),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * .015),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.projectTitle ?? '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: size.height * .005),
                                    Text(
                                      '24 Task',
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * .01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Progress',
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '75%',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: GFProgressBar(
                                    radius: 3,
                                    autoLive: true,
                                    animation: true,
                                    percentage: 0.5,
                                    progressBarColor: pendingColor,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.clockRotateLeft,
                                      color: textColor,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '3 Days left',
                                      style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * .01),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }else{
              return Center(
                child: labelTxt('No data found'),
              );
            }
          }),
    );
  }
}
