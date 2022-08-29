import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/models/task_model.dart';
import 'package:my_getx_playground/src/utils/app_snackbar.dart';

// https://stackoverflow.com/a/66739056
class StorageController extends GetxController {
  final box = GetStorage();
  final title = 'Get Storage'.obs;
  final tasks = <Map<String, dynamic>>[].obs;

  final taskTitleController = TextEditingController();
  final taskContentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final List<Map<String, dynamic>>? dbTask = box.read(myTask);
    if (dbTask != null) {
      for (var element in dbTask) {
        tasks.add(element);
      }
    }
  }

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
      tasks.add(task.toJson());
      box.write(myTask, tasks);
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
