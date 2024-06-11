import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/widgets/NavMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Column(
        children: [
          // Your TaskPage content here
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
                        Icon(Icons.topic_outlined, size: 30.sp),
                        SizedBox(width: 20.w),
                        Text(
                          'To Do List',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(67, 104, 80, 1),
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.add_box_outlined, size: 30.sp)
                  ],
                )
              ],
            ),
          ),
          //NavMenu
        ],
      ),
    );
  }
}
