import 'dart:convert';

import 'package:arms/Screens/welcome.dart';
import 'package:arms/constants/constant_api.dart';
import 'package:arms/controllers/navigation_controller.dart';
import 'package:arms/widgets/NavMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
//import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  Future<void> login({
    required String idNumber,
    required String password,
  }) async {
    try {
      isLoading(true);

      var data = {
        'id_number': idNumber,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}login'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      isLoading(false);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        token.value = responseData['token'];
        box.write('token', responseData['token']);

        //Snackbar for successful login
        showCustomSnackbar('Login Successful', 'Welcome Back!');

        //Navigate to NavMenu
        Get.offAll(() => const NavMenu());
      } else {
        //Error Handling for terminal
        var errorData = jsonDecode(response.body);
        debugPrint(errorData.toString());

        //Snackback for error
        showCustomSnackbar('Login Failed', errorData['message'], isError: true);
      }
    } catch (e) {
      isLoading(false);
      debugPrint(e.toString());

      //Snackbar for error
      showCustomSnackbar('Login Failed', 'An error occurred', isError: true);
    }
  }

  //Sign out
  void signOut() {
    box.remove('token');

    // Reset state of NavigationController
    Get.find<NavigationController>().resetState();
    Get.offAll(() => const Welcome());
  }

  void showCustomSnackbar(String title, String message,
      {bool isError = false}) {
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
}
