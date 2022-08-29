import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/task_model.dart';
import 'package:my_getx_playground/src/menu/storage/storage_controller.dart';
import 'package:my_getx_playground/src/menu/storage/view_input_task.dart';

class StorageScreen extends GetView<StorageController> {
  static const routeName = '/my_task';
  const StorageScreen({Key? key}) : super(key: key);

  void _showInputDialog() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: ViewInputTask(
          taskTitleController: controller.taskTitleController,
          taskContentController: controller.taskContentController,
          onCancel: () {
            controller.cancelTask();
          },
          onSave: () {
            controller.insertTask();
          },
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('My Task'),
        ),
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 8),
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final task = TaskModel.fromJson(controller.tasks[index]);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.titleTask ?? '',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(task.contentTask ?? ''),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showInputDialog,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
