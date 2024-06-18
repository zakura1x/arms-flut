import 'package:flutter/material.dart';

class ReviewQuestions extends StatefulWidget {
  @override
  _ReviewQuestionsState createState() => _ReviewQuestionsState();
}

class _ReviewQuestionsState extends State<ReviewQuestions> {
  List<Question> _questions = [
    Question(
      question:
          "Which organization developed the framework most commonly used by the auditing profession for benchmarking internal controls of non-issuers?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      selectedOption: 1,
    ),
    Question(
      question:
          "Which organization developed the framework most commonly used by the auditing profession for benchmarking internal controls of non-issuers?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      selectedOption: 1,
    ),
    Question(
      question: "Which is which?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      selectedOption: 2,
    ),
    Question(
      question: "What is love?",
      options: [
        "The Committee of Sponsoring Organizations of the Treadway Commission",
        "The Public Company Accounting Oversight Board",
        "The Financial Reporting Council",
        "The AICPA",
      ],
      selectedOption: 3,
    ),
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Questions'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _questions[index].question,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: _questions[index].options.map((option) {
                      int optionIndex =
                          _questions[index].options.indexOf(option);
                      bool isSelected =
                          optionIndex == _questions[index].selectedOption;
                      return Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(color: Colors.green, width: 2)
                              : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                      color: Colors.green.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]
                              : null,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: RadioListTile(
                          title: Text(option),
                          groupValue: _questions[index].selectedOption,
                          value: optionIndex,
                          onChanged: (value) {
                            setState(() {
                              _questions[index].selectedOption = value as int;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Question {
  String question;
  List<String> options;
  int selectedOption;

  Question({
    required this.question,
    required this.options,
    this.selectedOption = -1,
  });
}
