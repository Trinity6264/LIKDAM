import 'package:bloc_practice/constant/color_pallet.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/logic/Projects/cubit/add_project_cubit.dart';
import 'package:bloc_practice/logic/Projects/end/cubit/end_date_cubit.dart';
import 'package:bloc_practice/logic/Projects/start/cubit/startdate_cubit.dart';
import 'package:bloc_practice/logic/Projects/task/addTask/cubit/add_task_cubit.dart';
import 'package:bloc_practice/logic/Projects/task/createProject/cubit/create_project_cubit.dart';
import 'package:bloc_practice/logic/Projects/textForm/description/cubit/description_cubit.dart';
import 'package:bloc_practice/logic/Projects/textForm/title/title_cubit.dart';
import 'package:bloc_practice/model/category_model.dart';
import 'package:bloc_practice/model/project_model.dart';
import 'package:bloc_practice/model/task_model.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/Projects/textForm/category/cubit/category_cubit.dart';
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

  late TextEditingController taskController;
  late FocusNode taskNode;

  @override
  void initState() {
    taskController = TextEditingController();
    taskNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    taskController.dispose();
    taskNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = BlocProvider.of<TitleCubit>(context);
    final description = BlocProvider.of<DescriptionCubit>(context);
    final category = BlocProvider.of<AddProjectCubit>(context);
    final text = BlocProvider.of<CategoryCubit>(context);
    final startDate = BlocProvider.of<StartdateCubit>(context);
    final endDate = BlocProvider.of<EndDateCubit>(context);
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
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: size.width * .18),
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
                Expanded(
                  child: TextField(
                    focusNode: taskNode,
                    controller: taskController,
                    decoration: inputDec.copyWith(
                      hintText: 'Type task',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    taskNode.unfocus();
                    if (taskController.text.isEmpty ||
                        taskController.text == '') {
                      locator
                          .get<NavigationServices>()
                          .showBanner('Field is empty');
                    }
                    context.read<AddTaskCubit>().taskUpdate(
                          isAdd: true,
                          task: taskController.text.trim(),
                        );
                    taskController.clear();
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
              height: size.height * .55,
              child: BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  if (state is AddTaskUpdate) {
                    return ListView.builder(
                      key: const PageStorageKey('taskKey'),
                      itemCount: state.listofTask.length,
                      itemBuilder: (context, index) {
                        final task = state.listofTask[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              task.taskContent,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: task.isDone ? greenColor : null,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                task.isDone = !task.isDone;
                              });
                            },
                            trailing: IconButton(
                              onPressed: () {
                                context.read<AddTaskCubit>().taskUpdate(
                                      isAdd: false,
                                      task: task.taskContent,
                                    );
                              },
                              icon: const FaIcon(Icons.delete),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No Task found Add task'),
                    );
                  }
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
                    final createProject = context.read<CreateProjectCubit>();
                    final checking =
                        category.data == 'Other' ? text.data : category.data;
                    // print(title.data);
                    // print(description.description);
                    // print(checking);
                    // print(startDate.startDate);
                    // print(endDate.endDate);
                    final cat = CategoryModel(name: checking.toString());
                    final project = ProjectModel(
                      projectTitle: title.data,
                      projectDescription: description.description,
                      projectStart: startDate.startDate!,
                      projectEnd: endDate.endDate!,
                      projectUpdate: startDate.startDate!,
                      isCancel: false,
                      isfavourite: false,
                    );
                    final task = context.read<AddTaskCubit>();
                    createProject.createProject(
                      taskModel: task.allTask,
                      projectModel: project,
                      categoryModel: cat,
                    );
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
