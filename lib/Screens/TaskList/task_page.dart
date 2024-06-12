import 'package:arms/Screens/TaskList/task_add.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/controllers/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int selectedButtonIndex = 0; // Initially, no button is selected

  final TaskController taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    taskController.getAllTasks();
  }

  void filterTasks(int index) {
    setState(() {
      selectedButtonIndex = index;
    });

    if (index == 0) {
      taskController.filterTasks('all');
    } else if (index == 1) {
      taskController.filterTasks('inProgress');
    } else if (index == 2) {
      taskController.filterTasks('completed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Icon for back button
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, size: 25.sp),
                            onPressed: () {
                              controller.navigateBack();
                            },
                          ),
                          SizedBox(width: 10.w),
                          Icon(Icons.topic_outlined, size: 25.sp),
                          SizedBox(width: 10.w),
                          Text(
                            'To Do List',
                            style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(67, 104, 80, 1),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          controller.navigateToSubPage(const TaskAdd());
                        },
                        icon: Icon(Icons.add_box_outlined, size: 25.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonTaskList(
                          text: 'All Tasks',
                          onPressed: () {
                            filterTasks(0);
                          },
                          isSelected: selectedButtonIndex == 0,
                        ),
                        SizedBox(width: 15.w),
                        CustomButtonTaskList(
                          text: 'In Progress',
                          onPressed: () {
                            filterTasks(1);
                          },
                          isSelected: selectedButtonIndex == 1,
                        ),
                        SizedBox(width: 15.w),
                        CustomButtonTaskList(
                          text: 'Completed',
                          onPressed: () {
                            filterTasks(2);
                          },
                          isSelected: selectedButtonIndex == 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: taskController.filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = taskController.tasks[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    task.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_horiz, size: 25.sp),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                task.description,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(41, 45, 50, 1),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_rounded,
                                          size: 20.sp),
                                      SizedBox(width: 10.w),
                                      Text(
                                        task.dueDate
                                            .toString()
                                            .substring(0, 10),
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: task.status == 'completed'
                                          ? Color.fromRGBO(66, 96, 76, 1)
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 5.h),
                                      child: Text(
                                        task.status == 'completed'
                                            ? 'Completed'
                                            : 'In Progress',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonTaskList extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomButtonTaskList({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : null,
        backgroundColor: isSelected ? Colors.black : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
