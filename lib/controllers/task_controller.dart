import 'dart:convert';

import 'package:arms/constants/constant_api.dart';
import 'package:arms/models/task_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  final isLoading = false.obs;
  final box = GetStorage();
  Rx<List<TaskModel>> tasks = Rx<List<TaskModel>>([]);

  @override
  void onInit() {
    //getAllTasks();
    super.onInit();
  }

  // void getAllTasks() async {
  //   try {
  //     isLoading(true);

  //     var taskResult = await getTasks();
  //     if (taskResult != null) {
  //       tasks.assignAll(taskResult);
  //     }
  //   } catch (e) {
  //     print("Error in fetching tasks: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  //pull all the task from the user account
  Future getTasks(id) async{
    try{
      tasks.value.clear();

    }
  }


  // Future<List<Task>?> getTasks() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse('${url}get-tasks'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${box.read('token')}',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);

  //       var taskModel = TaskModel.fromJson(jsonResponse);
  //       return taskModel.tasks;
  //     } else {
  //       print("Failed to load tasks: ${response.body}");
  //       return [];
  //     }
  //   } catch (e) {
  //     print("Error in fetching tasks: $e");
  //     return [];
  //   }
  // }
}
