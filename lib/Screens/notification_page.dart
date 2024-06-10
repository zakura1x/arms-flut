import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Item> _data = [
    Item(
      header: 'New',
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz),
            SizedBox(width: 70.h),
            Column(
              children: [
                Text(
                    'M5 Test \nBSA 421K - TAXATION \nPosted on January 1, 2024'),
              ],
            ),
          ],
        ),
      ),
    ),
    Item(
      header: 'Old',
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz),
            SizedBox(width: 70.h),
            Column(
              children: [
                Text(
                    'M6 Test \nBSA 422K - AUDITING \nPosted on January 2, 2024'),
              ],
            ),
          ],
        ),
      ),
    ),
    Item(
      header: 'Announcements',
      body: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz),
            SizedBox(width: 70.h),
            Column(
              children: [
                Text(
                    'M7 Test \nBSA 423K - ACCOUNTING \nPosted on January 3, 2024'),
              ],
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFICATIONS'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: _buildPanel(),
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
            );
          },
          body: item.body,
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
  Widget body;
  bool isExpanded;
}
