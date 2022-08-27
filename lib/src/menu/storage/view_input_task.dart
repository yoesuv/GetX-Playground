import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double contentDialogPadding = 12;

class ViewInputTask extends StatelessWidget {
  final TextEditingController taskTitleController;
  final TextEditingController taskContentController;
  final Function onCancel;
  final Function onSave;

  const ViewInputTask({
    Key? key,
    required this.taskTitleController,
    required this.taskContentController,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: const Center(
            child: Text(
              'Insert New Task',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: contentDialogPadding,
          ),
          child: TextField(
            controller: taskTitleController,
            decoration: const InputDecoration(
              hintText: 'Task Title',
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: contentDialogPadding,
          ),
          child: TextField(
            controller: taskContentController,
            decoration: const InputDecoration(
              hintText: 'Task Content',
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(
            bottom: contentDialogPadding,
            left: contentDialogPadding,
            right: contentDialogPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                    onCancel();
                  },
                  style: OutlinedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                    onSave();
                  },
                  style: OutlinedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
