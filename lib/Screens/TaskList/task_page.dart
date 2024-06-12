import 'package:arms/controllers/navigation_controller.dart';
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
                      Icon(Icons.add_box_outlined, size: 25.sp),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonTaskList(
                          text: 'Completed',
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 0;
                            });
                          },
                          isSelected: selectedButtonIndex == 0,
                        ),
                        SizedBox(width: 15.w),
                        CustomButtonTaskList(
                          text: 'In Progress',
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 1;
                            });
                          },
                          isSelected: selectedButtonIndex == 1,
                        ),
                        SizedBox(width: 15.w),
                        CustomButtonTaskList(
                          text: 'To do',
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 2;
                            });
                          },
                          isSelected: selectedButtonIndex == 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Add more content if needed
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
