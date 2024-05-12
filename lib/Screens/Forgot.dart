import 'package:flutter/material.dart';
import 'package:arms/Screens/Welcome.dart';
import 'package:arms/Screens/Login.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key});

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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          // Forgot Password Form
          Column(
            children: [
              // App Bar with back button
              Container(
                height: 400, // Set the height here
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Remove shadow
                  automaticallyImplyLeading: false, // Prevent automatic back button
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white), // Make icon white
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
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(67, 104, 80, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Don’t worry! It happens sometimes. Enter your \ne-mail and we’ll send you a password \nreset link ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email Address',
                          labelStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      Padding(
                        /////////////Routing. plus import sa taas
                        padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
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
                            backgroundColor:
                                const Color.fromRGBO(67, 104, 80, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(90.0, 25.0, 90.0, 25.0),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 24.0,
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
            ],
          ),
        ],
      ),
    );
  }
}
