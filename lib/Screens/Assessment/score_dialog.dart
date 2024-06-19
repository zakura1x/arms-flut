import 'package:arms/Screens/Assessment/assessment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScoreDialog extends StatelessWidget {
  final int score;
  final int totalItems;

  const ScoreDialog({Key? key, required this.score, required this.totalItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent = score / totalItems;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Center(
          child: Text('Your Score from Test N6',
              style: GoogleFonts.poppins(fontSize: 16.sp))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 15.0,
            animation: true,
            percent: percent,
            center: Text(
              '${(percent * 100).toStringAsFixed(0)}%',
              style: GoogleFonts.poppins(
                  fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            footer: Text('Score: $score/$totalItems'),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.green,
          ),
          SizedBox(height: 16.0),
          TextButton(
              onPressed: () {
                // Handle view test button press
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color.fromARGB(255, 214, 214, 214),
                  minimumSize: Size(100, 60), // adjust the size as needed
                ),
                child: Center(
                  child: Text('View Test',
                      style: GoogleFonts.poppins(
                          color: Color.fromRGBO(67, 104, 80, 1))),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewQuestions()),
                  );
                },
              )),
        ],
      ),
    );
  }
}
