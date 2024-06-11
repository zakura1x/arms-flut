import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arms/Screens/home_page.dart';
import 'package:arms/Screens/notification_page.dart';
import 'package:arms/Screens/module_page.dart';
import 'package:arms/Screens/assessment_page.dart';
import 'package:arms/Screens/profile_page.dart';

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

  // void navigateToTaskPage() {
  //   Get.to(() => TaskPage());
  // }
}
