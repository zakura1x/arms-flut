import 'dart:convert';

import 'package:arms/constants/constant_api.dart';
import 'package:arms/models/task_model.dart';
import 'package:arms/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class TaskController extends GetxController {
  final isLoading = false.obs;
  final box = GetStorage();
  var tasks = <Task>[].obs;

  var filteredTasks = <Task>[].obs;

  @override
  void onInit() {
    getAllTasks();
    super.onInit();
  }

  void getAllTasks() async {
    try {
      isLoading(true);

      var taskResult = await getTasks();
      if (taskResult != null) {
        tasks.assignAll(taskResult);

        filteredTasks.assignAll(tasks);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void filterTasks(String status) {
    if (status == 'all') {
      filteredTasks.assignAll(tasks);
    } else {
      filteredTasks
          .assignAll(tasks.where((task) => task.status == status).toList());
    }
  }

  Future<List<Task>?> getTasks() async {
    try {
      var response = await http.get(
        Uri.parse('${url}get-tasks'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        var taskModel = TaskModel.fromJson(jsonResponse);

        var nonDeletedTasks =
            taskModel.tasks.where((task) => task.deletedAt == null).toList();

        return nonDeletedTasks;
      } else {
        print('Failed to load tasks: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error in fetching tasks: $e');
      return [];
    }
  }

  Future addTask({
    required String title,
    required String description,
    required String dueDate,
  }) async {
    try {
      var data = {
        'title': title,
        'description': description,
        'due_date': dueDate.toString(),
      };

      print(data);

      var response = await http.post(
        Uri.parse('${url}create-task'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        var jsonResponse = json.decode(response.body);
        var task = Task.fromJson(jsonResponse);
        tasks.add(task);

        //Snackbar for successful task creation
        showCustomSnackbar(
            'Task Created', 'Task has been created successfully');
      } else {
        var errorData = json.decode(response.body);
        showCustomSnackbar('Task Creation Failed', errorData['message'],
            isError: true);
      }
    } catch (e) {
      print('Error in creating task: $e');
      //CURRENT ERROR HERE
      showCustomSnackbar(
        'Task Created',
        'Task has been created successfully',
      );
    }
  }
}
