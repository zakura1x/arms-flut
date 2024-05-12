import 'package:flutter/material.dart';
import 'package:arms/Screens/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('logo.png',
                    width: 200,
                    height: 200,),
                ],
              ),
              SizedBox(height: 15),
              Text('Review System',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Color.fromRGBO(67, 104, 80, 100)),
                  ),
              SizedBox(height: 15),
              Text('Master your knowledge \nfor upcoming Exam',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(67, 104, 80, 100),
                  ),
                ),
              SizedBox(height: 15),
              Padding(
            /////////////Routing. plus import sa taas
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Login();
                    },
                  ),
                ); //////////////
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 10,
                backgroundColor: const Color.fromRGBO(67, 104, 80, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(90.0, 25.0, 90.0, 25.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20.0,
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