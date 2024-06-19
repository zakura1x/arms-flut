import 'package:arms/Screens/Modules/content_page.dart';
import 'package:arms/Screens/Modules/module_page.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            controller.navigateToSubPage(const ModulesPage());
          },
        ),
        title: Text(
          'Courses',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    'assets/image/course1.png', // Replace with your image asset
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BSA 421K - TAXATION',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Wed - Friday 5:30 PM - 7:00 PM',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                CustomCardModule(
                  title: "Module 1",
                  description: "Taxation Overview",
                  leadingIcon: Icons.book,
                  trailingIcon: Icons.play_arrow_outlined,
                  onTrailingIconPressed: () {
                    controller.navigateToSubPage(const ContentPage());
                  },
                ),
                CustomCardModule(
                  title: "Module 2",
                  description: "Types of Tax",
                  leadingIcon: Icons.book,
                  trailingIcon: Icons.play_arrow_outlined,
                  onTrailingIconPressed: () {
                    // Perform your action for Module 2 here
                  },
                ),
                CustomCardModule(
                  title: "Module 3",
                  description: "Laws of Taxation",
                  leadingIcon: Icons.book,
                  trailingIcon: Icons.play_arrow_outlined,
                  onTrailingIconPressed: () {
                    // Perform your action for Module 3 here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCardModule extends StatelessWidget {
  final String title;
  final String description;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTrailingIconPressed;

  const CustomCardModule({
    super.key,
    required this.title,
    required this.description,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTrailingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(leadingIcon, size: 40, color: Colors.green),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(66, 96, 76, 1),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onTrailingIconPressed,
              icon: Icon(trailingIcon,
                  size: 35.sp, color: Color.fromRGBO(66, 96, 76, 1)),
            )
          ],
        ),
      ),
    );
  }
}
