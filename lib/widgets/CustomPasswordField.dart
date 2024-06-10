import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordField({Key? key, required this.controller})
      : super(key: key);

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Password',
        labelStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 0.473),
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
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
