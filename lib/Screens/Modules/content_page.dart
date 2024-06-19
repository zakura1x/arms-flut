import 'package:arms/Screens/Modules/pdf_view.dart';
import 'package:arms/Screens/Modules/topic_page.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final List<Topic> topics = [
    Topic(
      title: "Topic 01",
      subtitle: "Tax Reform",
      pdfFiles: ["Taxation Reform", "Example File"],
      links: ["taxbuzz.com/taxation"],
    ),
    Topic(
      title: "Topic 02",
      subtitle: "Tax Scheme Overview",
      pdfFiles: ["Taxation Scheme", "Example File"],
      links: [],
    ),
    // Add more topics as needed
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            controller.navigateToSubPage(const TopicPage());
          },
        ),
        title: Text(
          'Module 1 - Taxation Overview',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Search topic title or number',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0.w),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFE0E0E0), // Light grey background
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return TopicTile(topic: topic);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Topic {
  final String title;
  final String subtitle;
  final List<String> pdfFiles;
  final List<String> links;

  Topic({
    required this.title,
    required this.subtitle,
    required this.pdfFiles,
    required this.links,
  });
}

class TopicTile extends StatefulWidget {
  final Topic topic;

  const TopicTile({required this.topic});

  @override
  _TopicTileState createState() => _TopicTileState();
}

class _TopicTileState extends State<TopicTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(Icons.description),
            SizedBox(width: 8),
            Text(
              widget.topic.title,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              widget.topic.subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: Icon(
          isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...widget.topic.pdfFiles.map((pdf) => ListTile(
                      leading: Icon(Icons.picture_as_pdf, color: Colors.red),
                      title: Text(
                        pdf,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        controller.navigateToSubPage(const PDFView());
                      },
                    )),
                ...widget.topic.links.map((link) => ListTile(
                      leading: Icon(Icons.link, color: Colors.blue),
                      title: Text(
                        link,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        // Handle link tap if necessary
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
