import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'; // Add this package to your pubspec.yaml

class CustomCardActivity extends StatelessWidget {
  final String title;
  final String score;
  final String total;
  final double percent;
  const CustomCardActivity(
      {super.key,
      required this.title,
      required this.score,
      required this.total,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 200.w,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(38, 42, 47, 1), width: 1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 8.0,
            percent: percent,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  score,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  total,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.grey.shade300,
            progressColor: Color.fromRGBO(67, 104, 80, 1),
          ),
        ],
      ),
    );
  }
}
