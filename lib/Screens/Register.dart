import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arms/widgets/CustomTextField.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This allows the Scaffold to adjust when the keyboard appears
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/image/loginbg.png',
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            fit: BoxFit.fill, // changed BoxFit.cover to BoxFit.fill
          ),
          // Registration Form
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().screenHeight *
                      0.4, // Adjust the height dynamically
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Registration',
                        style: GoogleFonts.poppins(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(67, 104, 80, 1),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(label: 'First Name'),
                      SizedBox(height: 20.h),
                      CustomTextField(label: 'Middle Name'),
                      SizedBox(height: 20.h),
                      CustomTextField(label: 'Last Name'),
                      SizedBox(height: 20.h),
                      CustomTextField(label: 'ID Number'),
                      SizedBox(height: 20.h),
                      CustomTextField(label: 'UNC Email'),
                      SizedBox(height: 20.h),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 0.473)),
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
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 40.h),
                        child: ElevatedButton(
                          onPressed: () {
                            // Registration logic goes here
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 10,
                            backgroundColor:
                                const Color.fromRGBO(67, 104, 80, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(90.w, 25.h, 90.w, 25.h),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(235, 235, 235, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Do you have already an Account? ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Login Now!',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                color: Color.fromRGBO(67, 104, 80, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
