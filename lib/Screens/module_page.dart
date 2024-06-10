import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModulesPage extends StatefulWidget {
  const ModulesPage({super.key});

  @override
  State<ModulesPage> createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COURSES'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search Course',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ModuleTile(
                  imagePath: 'assets/image/course1.png',
                  courseCode: 'BSA 421K',
                  courseTitle: 'TAXATION',
                ),
                ModuleTile(
                  imagePath: 'assets/image/course2.png',
                  courseCode: 'BSA 312N',
                  courseTitle: 'MANAGEMENT',
                ),
                ModuleTile(
                  imagePath: 'assets/image/course3.png',
                  courseCode: 'BSA 462Q',
                  courseTitle: 'AUDITING',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModuleTile extends StatelessWidget {
  final String imagePath;
  final String courseCode;
  final String courseTitle;

  ModuleTile({
    required this.imagePath,
    required this.courseCode,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              'assets/image/course1.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$courseCode - $courseTitle',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
