import 'package:arms/Screens/assessment_page.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/Screens/module_page.dart';
import 'package:arms/Screens/notification_page.dart';
import 'package:arms/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            ),
            child: NavigationBar(
              height: 60.h,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.onDestinationSelected(index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home, size: 30),
                  selectedIcon: Icon(Icons.home,
                      size: 30, color: Color.fromRGBO(67, 104, 80, 1)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.notifications, size: 30),
                  selectedIcon: Icon(Icons.notifications,
                      size: 30, color: Color.fromRGBO(67, 104, 80, 1)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.local_library, size: 30),
                  selectedIcon: Icon(Icons.local_library,
                      size: 30, color: Color.fromRGBO(67, 104, 80, 1)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.quiz, size: 30),
                  selectedIcon: Icon(Icons.quiz,
                      size: 30, color: Color.fromRGBO(67, 104, 80, 1)),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person, size: 30),
                  selectedIcon: Icon(Icons.person,
                      size: 30, color: Color.fromRGBO(67, 104, 80, 1)),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        body: Obx(() => controller.pages[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    NotificationsPage(),
    ModulesPage(),
    AssessmentPage(),
    ProfilePage(),
  ];

  void onDestinationSelected(int index) {
    selectedIndex.value = index;
  }
}
