import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon; // Add this line

  const CustomTextField(
      {Key? key, required this.label, required this.controller, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
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
        prefixIcon: icon != null ? Icon(icon) : null, // Add this line
      ),
    );
  }
}
