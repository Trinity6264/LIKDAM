import 'package:bloc_practice/logic/date/end/cubit/end_date_cubit.dart';
import 'package:bloc_practice/logic/date/start/cubit/startdate_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/utils/labeltxt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/date_selector.dart';

class AddProjects extends StatefulWidget {
  final PageController pageCtrl;
  const AddProjects({Key? key, required this.pageCtrl}) : super(key: key);

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late FocusNode titleFocus;
  late FocusNode descriptionFocus;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    startDate = DateTime.now();
    endDate = DateTime.now();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleFocus = FocusNode();
    descriptionFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    titleFocus.dispose();
    descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteBgColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .1),
                    labelTxt('Title'),
                    SizedBox(height: size.height * .02),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: titleController,
                      focusNode: titleFocus,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val!.isEmpty || val == '') {
                          return 'Project title required';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: cancelColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    labelTxt('Description'),
                    SizedBox(height: size.height * .02),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: descriptionController,
                      focusNode: descriptionFocus,
                      textInputAction: TextInputAction.done,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: cancelColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    labelTxt('Start date'),
                    SizedBox(height: size.height * .02),
                    BlocBuilder<StartdateCubit, StartdateState>(
                      builder: (context, state) {
                        if (state is Startdatedone) {
                          return DateSelector(
                            date: state.date!,
                            onPressed: () async =>
                                await context.read<StartdateCubit>().pickDate(
                                      context,
                                      state.date!,
                                    ),
                          );
                        }
                        return DateSelector(
                          date: startDate!,
                          onPressed: () async {
                            await context.read<StartdateCubit>().pickDate(
                                  context,
                                  startDate!,
                                );
                          },
                        );
                      },
                    ),
                    SizedBox(height: size.height * .02),
                    labelTxt('End date'),
                    SizedBox(height: size.height * .02),
                    BlocBuilder<EndDateCubit, EndDateState>(
                      builder: (context, state) {
                        if (state is EndDatePicked) {
                          return DateSelector(
                            date: state.dateTime,
                            onPressed: () async =>
                                await context.read<EndDateCubit>().pickDate(
                                      context,
                                      state.dateTime,
                                    ),
                          );
                        }
                        return DateSelector(
                          date: endDate!.add(const Duration(days: 1)),
                          onPressed: () async =>
                              await context.read<EndDateCubit>().pickDate(
                                    context,
                                    startDate!,
                                  ),
                        );
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * .1,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: size.height * .09,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    titleFocus.unfocus();
                    descriptionFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      widget.pageCtrl.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      return;
                    }
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
