import 'package:flutter/material.dart';
import 'package:arms/Screens/Welcome.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/image/loginbg.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill, // changed BoxFit.cover to BoxFit.fill
            ),
            // Login Form
            Container(
              // Removed padding here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                  ),
                  Expanded(
                    child: Container(
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
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(67, 104, 80, 100),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'ID Number',
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
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
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
                          SizedBox(height: 16),
                          Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(67, 104, 80, 100),
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
                                ); //////////////
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
                                padding:
                                    EdgeInsets.fromLTRB(90.0, 25.0, 90.0, 25.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(235, 235, 235, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Don’t Have an account? Register Now!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(67, 104, 80, 100),
                            ),
                          ),
                        ],
                      ),
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
