import 'package:arms/Screens/Authentication/forgot_form.dart';
import 'package:arms/widgets/Buttons.dart';
import 'package:arms/widgets/CustomPasswordField.dart';
import 'package:arms/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:arms/controllers/authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController idNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  //Authentication Controller
  final AuthenticationController _authController =
      Get.put(AuthenticationController());

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
            width: 500.w,
            height: 500.h,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
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
                            'LOGIN',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(67, 104, 80, 1),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            label: 'ID Number',
                            controller: idNumber,
                            icon: Icons.person,
                          ),
                          SizedBox(height: 20.h),
                          CustomPasswordField(controller: password),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotForm(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontStyle: FontStyle.italic,
                                    color: const Color.fromRGBO(67, 104, 80, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(() {
                            return _authController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Buttons(
                                    onPressed: () async {
                                      await _authController.login(
                                        idNumber: idNumber.text.trim(),
                                        password: password.text.trim(),
                                      );
                                    },
                                    buttonText: 'LOGIN',
                                  );
                          }),
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
