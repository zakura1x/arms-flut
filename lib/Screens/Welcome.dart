import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(208, 217, 211, 1),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 200.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/logo.png',
                    width: 200.w,
                    height: 200.h,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                'Review System',
                style: GoogleFonts.poppins(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(67, 104, 80, 1),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Master your knowledge \nfor upcoming Exam',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(67, 104, 80, 1),
                ),
              ),
              SizedBox(height: 166.h),
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 60.h, 10.w, 40.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Login();
                        },
                      ),
                    );
                  },
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
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color.fromRGBO(235, 235, 235, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
