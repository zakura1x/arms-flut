import 'package:arms/Screens/Assessment/assessment_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(67, 104, 80, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        height: 520.h,
        width: 300.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.warning_amber_rounded,
                  size: 80, color: Colors.white),
            ),
            Text(
                'Before you proceed, remember:\n'
                'Success requires effort!\n'
                'Ensure you aim for the passing grade (75%) on this assessment. Don\'t rush, take your time to understand and answer each question thoughtfully. \nRemember, your dedication and focus pave the way to achievement.\n'
                'Best of luck!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => IntroAssessment()),
                );
              },
              child: Text(
                'Understood',
                style: TextStyle(
                    color: Color.fromRGBO(67, 104, 80, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
