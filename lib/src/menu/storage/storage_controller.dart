import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/task_model.dart';
import 'package:my_getx_playground/src/utils/app_snackbar.dart';

class StorageController extends GetxController {
  final title = 'Get Storage'.obs;
  final tasks = <TaskModel>[].obs;

  final taskTitleController = TextEditingController();
  final taskContentController = TextEditingController();

  void insertTask() {
    debugPrint('StorageController # insert task');
    if (taskTitleController.text.isEmpty) {
      snackBarWarning('Insert Task', 'Input Task Title');
    } else if (taskContentController.text.isEmpty) {
      snackBarWarning('Insert Task', 'Input Task Content');
    } else {
      final task = TaskModel(
        id: 1,
        titleTask: taskTitleController.text,
        contentTask: taskContentController.text,
      );
      debugPrint('StorageController # task ${task.toJson()}');
      tasks.add(task);
      _clearTextController();
    }
  }

  void cancelTask() {
    debugPrint('StorageController # cancel insert');
    _clearTextController();
  }

  void _clearTextController() {
    taskTitleController.clear();
    taskContentController.clear();
  }
}
