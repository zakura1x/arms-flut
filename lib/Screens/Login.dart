import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/Forgot.dart';
import 'package:arms/Screens/HomePage.dart';
import 'package:arms/Screens/Register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arms/widgets/CustomTextField.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This allows the Scaffold to adjust when the keyboard appears
      body: Container(
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/image/loginbg.png',
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              fit: BoxFit.fill,
            ),
            // Login Form
            SingleChildScrollView(
              // Wrap the Column in SingleChildScrollView
              child: Column(
                children: [
                  Container(
                    height: ScreenUtil().screenHeight *
                        0.4, // Adjust the height dynamically
                  ),
                  Container(
                    height: ScreenUtil().screenHeight *
                        0.6, // Adjust the height dynamically
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
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(67, 104, 80, 1),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(label: 'ID Number'),
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
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forgot()),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(67, 104, 80, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return HomePage();
                                  },
                                ),
                              );
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
                                'Login',
                                style: GoogleFonts.poppins(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(235, 235, 235, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t Have an account?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                  // Add navigation logic for registration page
                                },
                                child: Text(
                                  ' Register Now!',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromRGBO(67, 104, 80, 1),
                                  ),
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
      ),
    );
  }
}
