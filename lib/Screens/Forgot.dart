import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/Login.dart';
import 'package:arms/Screens/ForgotMessage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arms/widgets/CustomTextField.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/image/loginbg.png',
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            fit: BoxFit.fill,
          ),
          // Forgot Password Form
          Column(
            children: [
              // App Bar with back button
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0, // Remove shadow
                automaticallyImplyLeading:
                    false, // Prevent automatic back button
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white), // Make icon white
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Login();
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.sp),
                        topRight: Radius.circular(40.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Forgot Password?',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(67, 104, 80, 1),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Don’t worry! It happens sometimes. Enter your \ne-mail and we’ll send you a password \nreset link ',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(label: 'Email'),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(10.w, 60.h, 10.w, 40.h),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const ForgotMessage();
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
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(90.w, 25.h, 90.w, 25.h),
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
