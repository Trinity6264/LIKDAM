import 'package:bloc_practice/logic/Projects/textForm/category/cubit/category_cubit.dart';
import 'package:bloc_practice/utils/input_dec.dart';
import 'package:flutter/material.dart';

import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/utils/labeltxt.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/Projects/cubit/add_project_cubit.dart';
import '../../../logic/Projects/end/cubit/end_date_cubit.dart';
import '../../../logic/Projects/start/cubit/startdate_cubit.dart';

import '../../../logic/Projects/textForm/description/cubit/description_cubit.dart';
import '../../../logic/Projects/textForm/title/title_cubit.dart';
import '../../../utils/date_selector.dart';

class AddProjects extends StatefulWidget {
  final PageController pageCtrl;
  const AddProjects({Key? key, required this.pageCtrl}) : super(key: key);

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode titleFocus;
  late FocusNode catFocus;
  late FocusNode descriptionFocus;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    final start = context.read<StartdateCubit>().startDate;
    final end = context.read<EndDateCubit>().endDate;
    final cat = context.read<AddProjectCubit>().data;
    startDate = DateTime.now();
    endDate = DateTime.now();
    context.read<StartdateCubit>().initialDate(start ?? startDate!);
    context.read<AddProjectCubit>().selectCategory(cat ?? 'Mobile UI Design');
    context.read<EndDateCubit>().initialDate(end?.subtract(
          const Duration(days: 1),
        ) ??
        endDate!);
    titleFocus = FocusNode();
    descriptionFocus = FocusNode();
    catFocus = FocusNode();
    super.initState();
  }

  static const List<String> categoryItems = [
    'Mobile UI Design',
    'Api Integration',
    'Web Frontend design',
    'Backend Design',
    'Database Modelling',
    'Other'
  ];

  @override
  void dispose() {
    titleFocus.dispose();
    descriptionFocus.dispose();
    catFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                    BlocBuilder<TitleCubit, TitleState>(
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.name,
                          initialValue:
                              state is TitleUpdated ? state.title : '',
                          focusNode: titleFocus,
                          textInputAction: TextInputAction.next,
                          onChanged: (val) {
                            context.read<TitleCubit>().updateText(val);
                          },
                          validator: (val) {
                            if (val!.isEmpty || val == '') {
                              return 'Project title required';
                            } else {
                              return null;
                            }
                          },
                          decoration: inputDec,
                        );
                      },
                    ),
                    SizedBox(height: size.height * .02),
                    labelTxt('Description'),
                    SizedBox(height: size.height * .02),
                    BlocBuilder<DescriptionCubit, DescriptionState>(
                      builder: (context, state) {
                        return TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: state is DescriptionUpdate
                                ? state.description
                                : '',
                            onChanged: (val) {
                              context
                                  .read<DescriptionCubit>()
                                  .updateDescription(val);
                            },
                            focusNode: descriptionFocus,
                            textInputAction: TextInputAction.done,
                            maxLines: 10,
                            decoration: inputDec);
                      },
                    ),
                    SizedBox(height: size.height * .02),
                    labelTxt('Category'),
                    SizedBox(height: size.height * .02),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: size.height * .07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: textColor.withOpacity(.3),
                        ),
                      ),
                      child: BlocBuilder<AddProjectCubit, AddProjectState>(
                        builder: (context, state) {
                          return DropdownButtonFormField(
                            value: state is AddProjectSelectCat
                                ? state.selectedCat
                                : null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            items: categoryItems
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              context
                                  .read<AddProjectCubit>()
                                  .selectCategory(val!);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    BlocBuilder<AddProjectCubit, AddProjectState>(
                      builder: (context, state) {
                        if (state is AddProjectSelectCat) {
                          if (state.selectedCat == 'Other') {
                            return BlocBuilder<CategoryCubit, CategoryState>(
                              builder: (context, state) {
                                return TextFormField(
                                    keyboardType: TextInputType.name,
                                    initialValue: state is CategoryUpdate
                                        ? state.text
                                        : '',
                                    focusNode: catFocus,
                                    onChanged: (val) {
                                      context.read<CategoryCubit>().update(val);
                                    },
                                    textInputAction: TextInputAction.next,
                                    validator: (val) {
                                      if (val!.isEmpty || val == '') {
                                        return 'Project Category required';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: inputDec);
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        return const SizedBox.shrink();
                      },
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
                color: whiteBgColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    titleFocus.unfocus();
                    descriptionFocus.unfocus();
                    catFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      widget.pageCtrl.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      return;
                    }
                  },
                  child: const Text('Add Project'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
