import 'package:arms/Screens/Assessment/submit_dialog.dart';
import 'package:flutter/material.dart';

class AssessmentStart extends StatefulWidget {
  const AssessmentStart({Key? key}) : super(key: key);

  @override
  State<AssessmentStart> createState() => _AssessmentStartState();
}

class _AssessmentStartState extends State<AssessmentStart> {
  int _currentQuestion = 1;
  int _score = 0;

  List<Question> _questions = [
    Question(
      question:
          "Which organization developed the framework most commonly used by the auditing profession for bench marking internal controls of non-issuers?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      correctAnswer: 0,
    ),
    Question(
      question:
          "Which organization developed the framework most commonly used by the auditing profession for bench marking internal controls of non-issuers?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      correctAnswer: 1,
    ),
    Question(
      question: "Which is which?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      correctAnswer: 2,
    ),
    Question(
      question: "What is love?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      correctAnswer: 2,
    ),
    // Add more questions here...
  ];

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
    });
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestion--;
    });
  }

  void _checkAnswer(int selectedOption) {
    if (selectedOption == _questions[_currentQuestion - 1].correctAnswer) {
      setState(() {
        _score++;
      });
    }
    if (_currentQuestion < _questions.length) {
      _nextQuestion();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SubmitDialog(score: _score, totalItems: _questions.length);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assessment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              _questions[_currentQuestion - 1].question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ..._questions[_currentQuestion - 1].options.map((option) {
              return RadioListTile(
                title: Text(option),
                value: _questions[_currentQuestion - 1].options.indexOf(option),
                groupValue: _questions[_currentQuestion - 1].selectedOption,
                onChanged: (value) {
                  setState(() {
                    _questions[_currentQuestion - 1].selectedOption = value!;
                  });
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(170, 100),
                  backgroundColor: Color.fromRGBO(220, 27, 27, 0.69)),
              onPressed: _currentQuestion > 1 ? _previousQuestion : null,
              child: Text(
                "Previous",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(170, 100),
                  backgroundColor: Color.fromRGBO(67, 104, 80, 1)),
              onPressed: _currentQuestion <= _questions.length
                  ? () {
                      _checkAnswer(
                          _questions[_currentQuestion - 1].selectedOption);
                    }
                  : null,
              child: Text(
                "Next",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String question;
  List<String> options;
  int correctAnswer;
  int selectedOption;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.selectedOption = -1,
  });
}
