import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const Buttons({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          elevation: 10,
          backgroundColor: const Color.fromRGBO(67, 104, 80, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(90.w, 25.h, 90.w, 25.h),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(235, 235, 235, 1),
            ),
          ),
        ),
      ),
    );
  }
}
