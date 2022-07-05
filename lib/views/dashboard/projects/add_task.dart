import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/logic/Projects/textForm/description/cubit/description_cubit.dart';
import 'package:bloc_practice/logic/Projects/textForm/title/title_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/input_dec.dart';
import '../../../utils/labeltxt.dart';

class AddTask extends StatefulWidget {
  final PageController controller;
  const AddTask({Key? key, required this.controller}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isChecked = false;
  String title = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .08),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.controller.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.ease,
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: size.width * .2),
                Text(
                  'PROJECT DETAIL',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .02),
            BlocBuilder<TitleCubit, TitleState>(
              builder: (context, state) {
                return Text(
                  state is TitleUpdated ? state.title : '',
                  style: GoogleFonts.poppins(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            SizedBox(height: size.height * .03),
            labelTxt('Description:'),
            BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                return Text(
                  state is DescriptionUpdate ? state.description : '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(),
                );
              },
            ),
            SizedBox(height: size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (_) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'PROJECT DETAIL',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  initialValue: '',
                                  onChanged: (val) {},
                                  // focusNode: descriptionFocus,
                                  textInputAction: TextInputAction.done,

                                  decoration: inputDec,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add Task',
                    style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .01),
            SizedBox(
              width: double.infinity,
              height: size.height * .5,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      leading: Icon(
                        isChecked
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_sharp,
                        color: isChecked ? primaryColor : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final data = BlocProvider.of<TitleCubit>(context);
                    print(data.data);
                  },
                  child: const Text('Create Project'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
