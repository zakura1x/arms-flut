import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/Welcome.dart';
import 'package:arms/Screens/Login.dart';

class ForgotMessage extends StatefulWidget {
  const ForgotMessage({Key? key}) : super(key: key);

  @override
  State<ForgotMessage> createState() => _ForgotMessageState();
}

class _ForgotMessageState extends State<ForgotMessage> {
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
                automaticallyImplyLeading: false, // Prevent automatic back button
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white), // Make icon white
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
                            'Forgot \nPassword?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(67, 104, 80, 1),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'The reset link was Sent to your email. Kindly check your spam if you cannot find it.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20.h),  
                          //Success Icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Color.fromRGBO(37, 130, 69, 1),
                                size: 80.sp,
                              ),
                            ],
                          ),                  
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 40.h),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const Welcome();
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                elevation: 10,
                                backgroundColor: const Color.fromRGBO(67, 104, 80, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(60.w, 25.h, 60.w, 25.h),
                                child: Text(
                                  'Return to Login',
                                  style: TextStyle(
                                    fontSize: 24.sp,
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
