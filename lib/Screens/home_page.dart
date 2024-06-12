//import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/Screens/TaskList/task_page.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/widgets/custom_card_activity.dart';
import 'package:arms/widgets/custom_home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Color.fromRGBO(107, 114, 134, 1),
                    ),
                  ),
                  Text(
                    'John Doe',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(67, 104, 80, 1),
                    ),
                  ),
                ],
              ),
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/image/loginbg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        Container(
          height: 200.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              //color: Color.fromRGBO(67, 104, 80, 1),
              borderRadius: BorderRadius.circular(20.sp),
              border: Border.all(
                color: Colors.black,
                width: 1,
              )),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Statistics',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Assessment Performance',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(67, 104, 80, 1),
                  ),
                ),
                SizedBox(height: 10.h),
                LinearProgressIndicator(
                  value: 0.5, // Progress percentage
                  backgroundColor: Colors.grey.shade300,
                  color: Color.fromRGBO(67, 104, 80, 1),
                  minHeight: 10.h,
                ),
                SizedBox(height: 5.h),
                Text(
                  '50% of passed assessment',
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.italic,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(41, 45, 50, 0.7),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '7 Passed',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(37, 130, 69, 1),
                      ),
                    ),
                    Text(
                      '7 Passed',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(37, 130, 69, 1),
                      ),
                    ),
                    Text(
                      '7 Passed',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(37, 130, 69, 1),
                      ),
                    ),
                    SizedBox(width: 60.w)
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'To do List',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(67, 104, 80, 1),
                ),
              ),
              //Make a view all button
              TextButton(
                  onPressed: () {
                    //Navigate to taskpage
                    controller.navigateToSubPage(const TaskPage());
                  },
                  child: Text(
                    'View All',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(97, 97, 97, 1),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 230.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomHomeCard(
                  title: 'Read Taxation',
                  content: 'Suggested from your previous test');
            },
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Recent Activities',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(67, 104, 80, 1),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 230.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomCardActivity(
                title: 'A6 Test',
                score: '40',
                total: '/50',
                percent: 0.8,
              );
            },
          ),
        ),
      ],
    ));
  }
}
