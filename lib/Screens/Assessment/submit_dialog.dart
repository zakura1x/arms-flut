import 'package:arms/Screens/Assessment/assessment_review.dart';
import 'package:arms/Screens/Assessment/score_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitDialog extends StatelessWidget {
  final int score;
  final int totalItems;

  const SubmitDialog(
      {super.key, required this.score, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(child: Text('Submit Assessment')),
      content: Text('Do you want to submit your answers?'),
      actions: [
        SizedBox(
          height: 50.h,
          width: 310.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(220, 27, 27, 0.69), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ReviewQuestions()),
              );
            },
            child: Text('Review Answers'),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 50.h,
          width: 310.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(67, 104, 80, 1), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) =>
                    ScoreDialog(score: score, totalItems: totalItems),
              );
            },
            child: Text('Confirm Submit'),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.all(10),
      //contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    );
  }
}
