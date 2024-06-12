import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arms/controllers/navigation_controller.dart'; // Ensure correct path

class NavMenu extends StatelessWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: NavigationBarTheme(
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
        body: controller.currentSubPage.value, // Show the current page
      ),
    );
  }
}
