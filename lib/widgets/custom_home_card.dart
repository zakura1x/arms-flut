import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.w,
        height: 250.h,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(38, 42, 47, 1), width: 1.5),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(38, 42, 47, 1),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(41, 45, 50, 1),
              ),
            ),
          ],
        ));
  }
}
