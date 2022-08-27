import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/utils/app_snackbar.dart';

class StorageController extends GetxController {
  final title = 'Get Storage'.obs;

  final taskTitleController = TextEditingController();
  final taskContentController = TextEditingController();

  void insertTask() {
    debugPrint('StorageController # insert task');
    if (taskTitleController.text.isEmpty) {
      snackBarWarning('Insert Task', 'Input Task Title');
    } else if (taskContentController.text.isEmpty) {
      snackBarWarning('Insert Task', 'Input Task Content');
    } else {
      debugPrint('StorageController # task title ${taskTitleController.text}');
      debugPrint(
          'StorageController # task content ${taskContentController.text}');
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
