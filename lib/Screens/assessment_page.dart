import 'package:arms/Screens/Assessment/passing_grade.dart';
import 'package:flutter/material.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  List<Item> _data = [
    Item(
      header: 'New Assessment',
      body: [
        AssessmentTile(code: 'A1', title: 'Test A1: Auditing & Attestation'),
      ],
    ),
    Item(
      header: 'Finished Assessment',
      body: [
        AssessmentTile(code: 'N6', title: 'Test N6: Taxation Reform'),
        AssessmentTile(code: 'C9', title: 'Test C9: Intro to Tax'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASSESSMENTS'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for Test title or number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.filter_alt_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            _buildPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.header),
              trailing: item.header == 'New Assessment'
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.note_add),
                        SizedBox(width: 4),
                        Text('+1'),
                      ],
                    )
                  : null,
            );
          },
          body: Column(
            children: item.body.map<Widget>((AssessmentTile tile) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(tile.code),
                ),
                title: Text(tile.title),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PassingDialog();
                    },
                  );
                },
              );
            }).toList(),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });

  String header;
  List<AssessmentTile> body;
  bool isExpanded;
}

class AssessmentTile {
  AssessmentTile({
    required this.code,
    required this.title,
  });

  String code;
  String title;
}
