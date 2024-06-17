import 'package:arms/Screens/TaskList/task_page.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/controllers/task_controller.dart';
import 'package:arms/widgets/Buttons.dart';
import 'package:arms/widgets/custom_snackbar.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final dateController = BoardDateTimeTextController();

  final TaskController taskController = Get.find<TaskController>();

  String? dueDate;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.navigateToSubPage(const TaskPage());
                            },
                            icon: Icon(Icons.arrow_back_ios_new, size: 25.sp),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Add Task',
                            style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[800],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Title',
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter your task title here',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // Add this line
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        controller: descriptionController,
                        maxLines: 8,
                        minLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Enter your task description here',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.w,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // Add this line
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Time',
                        style: GoogleFonts.poppins(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(height: 5.h),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: 12.0), // Adjust the padding as needed
                            child: Icon(
                              Icons.edit_calendar_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          BoardDateTimeInputField(
                            delimiter: '-',
                            controller: dateController,
                            pickerType: DateTimePickerType.datetime,
                            initialDate: DateTime.now(),
                            options: const BoardDateTimeOptions(
                              inputable: false,
                              pickerFormat: PickerFormat.ymd,
                              languages: BoardPickerLanguages.en(),
                            ),
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            onChanged: (date) {
                              setState(() {
                                dueDate =
                                    DateFormat('yyyy-MM-dd HH:mm').format(date);
                              });
                            },
                            onFocusChange: (val, date, text) {
                              //print('onFocusChange: $val, $date, $text');
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Buttons(
                          onPressed: () async {
                            await taskController.addTask(
                                title: titleController.text.trim(),
                                description: descriptionController.text.trim(),
                                dueDate: dueDate!);

                            controller.navigateToSubPage(const TaskPage());
                          },
                          buttonText: 'Add Task'),
                      SizedBox(height: 50.h),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
