import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX for navigation and overlays
import 'package:top_snackbar_flutter/top_snack_bar.dart'; // Assuming you are using this package
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // No UI needed for this widget
  }
}

void showCustomSnackbar(String title, String message, {bool isError = false}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = Get.overlayContext;
    if (context != null) {
      final overlayState = Overlay.of(context);
      if (overlayState != null) {
        if (isError) {
          showTopSnackBar(
            overlayState,
            CustomSnackBar.error(
              message: message,
              textStyle: const TextStyle(fontSize: 20),
            ),
          );
        } else {
          showTopSnackBar(
            overlayState,
            CustomSnackBar.success(
              message: message,
              textStyle: const TextStyle(fontSize: 20),
            ),
          );
        }
      }
    }
  });
}
