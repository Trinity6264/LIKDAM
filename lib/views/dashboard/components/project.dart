import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isExpand = false;

  void onExpand() {
    isExpand = !isExpand;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: size.height * .05),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                SizedBox(width: size.width * 0.15),
                Text(
                  'Project Detail',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Ui Design',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '3 days left',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width * .2,
                  height: size.height * .05,
                  decoration: BoxDecoration(
                    color: pendingColor.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Pending',
                      style: GoogleFonts.poppins(
                        color: pendingColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Description:',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .02),
            const Text(
              'jdjhskjahhghghfgfgfhfhfhghghdghghsfhfsgshfghsgsfgsjhsfjhsfhjhsfhjsfhjfshjhjhsfhjfshjhsfhjsfhjsfhjfsjjfsjfsjfsjjfshjsfhjfhhjsfhjfshsfhhfshjsfhfshfshjhjfshj',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: textColor,
              ),
            ),
            SizedBox(height: size.height * .02),
            Expanded(
              child: AnimatedList(
                initialItemCount: 10,
                itemBuilder: (context, index, value) {
                  return SizedBox(
                    width: double.infinity,
                    height: size.height * .08,
                    child: Card(
                      elevation: 3.0,
                      shadowColor: primaryColor.withOpacity(0.3),
                      child: ListTile(
                        leading: Checkbox(
                          value: true,
                          onChanged: (val) {},
                        ),
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
}
