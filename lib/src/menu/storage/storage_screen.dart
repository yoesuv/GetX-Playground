import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/storage/storage_controller.dart';

class StorageScreen extends GetView<StorageController> {
  static const routeName = '/my_task';
  const StorageScreen({Key? key}) : super(key: key);

  void _showInputDialog() {
    Get.defaultDialog(
      title: 'Insert New Task',
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Task Title',
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Task Content',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
      radius: 8,
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
          child: Center(
            child: Text(controller.title.value),
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
