import 'package:flutter/material.dart';

class ViewQuestions extends StatefulWidget {
  @override
  _ViewQuestionsState createState() => _ViewQuestionsState();
}

class _ViewQuestionsState extends State<ViewQuestions> {
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
      isCorrect: true,
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
      isCorrect: true,
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
      isCorrect: false,
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
      isCorrect: false,
    ),
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Questions'),
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
                    children:
                        _questions[index].options.asMap().entries.map((entry) {
                      int optionIndex = entry.key;
                      String option = entry.value;
                      bool isSelected =
                          optionIndex == _questions[index].selectedOption;
                      bool isCorrect =
                          _questions[index].isCorrect && isSelected;

                      return Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(color: Colors.green, width: 2)
                              : null,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 112, 190, 115)
                                            .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ]
                              : null,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: RadioListTile(
                          title: Text(option),
                          groupValue: _questions[index].selectedOption,
                          value: optionIndex,
                          onChanged: null, // disable radio button interaction
                          secondary: isCorrect
                              ? Icon(Icons.check, color: Colors.green)
                              : isSelected
                                  ? Icon(Icons.close, color: Colors.red)
                                  : null,
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
  bool isCorrect;

  Question({
    required this.question,
    required this.options,
    required this.selectedOption,
    required this.isCorrect,
  });
}
