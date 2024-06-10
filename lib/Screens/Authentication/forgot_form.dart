import 'package:arms/widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arms/Screens/Authentication/forgot_message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arms/widgets/CustomTextField.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/image/loginbg.png',
            width: 500.w,
            height: 600.h,
            fit: BoxFit.fill,
          ),
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
                    Navigator.of(context).pop();
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
                              color: const Color.fromRGBO(67, 104, 80, 1),
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
                          CustomTextField(
                            label: 'Email',
                            controller: emailController,
                            icon: Icons.email,
                          ),
                          SizedBox(height: 20.h),
                          Buttons(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ForgotMessage();
                                  },
                                ),
                              );
                            },
                            buttonText: 'Submit',
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
