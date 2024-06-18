import 'package:arms/Screens/Assessment/assessment_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroAssessment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TEST A1: AUDITING & ATTESTATION',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(67, 104, 80, 1),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus turpis eros, venenatis non massa a, interdum pharetra dui. Praesent gravida neque nec tempor viverra. In suscipit condimentum quam quis vehicula. Sed maximus, magna quis tincidunt iaculis, mi massa vulputate dolor, vitae varius orci justo at risus. Aenean eu iaculis enim, vitae pulvinar est. Donec volutpat convallis pulvinar. Nullam mollis lorem orci, non ullamcorper neque tempus vitae.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(67, 104, 80, 1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IMPORTANT REMINDERS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(67, 104, 80, 1),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Duration: 1 hr',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Due date: 6/12/2024',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AssessmentStart()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Color.fromRGBO(67, 104, 80, 1),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: Text('Proceed', style: TextStyle(color: Colors.white)),
          ),
        ));
  }
}
