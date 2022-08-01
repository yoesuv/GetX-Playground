import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/picker/picker_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';
import 'package:permission_handler/permission_handler.dart';

class PickerScreen extends GetView<PickerController> {
  static const routeName = '/picker';
  const PickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Picker Screen'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: controller.imageFile.value != null
                    ? _loadImage(controller.imageFile.value!)
                    : _emptyImage(),
              ),
              const SizedBox(height: 12),
              Text(controller.storagePermission.value.name),
              const SizedBox(height: 12),
              Center(
                child: MyButton(
                  label: 'Open Gallery',
                  onPressed: () {
                    if (controller.storagePermission.value ==
                        PermissionStatus.granted) {
                      controller.openGallery();
                    } else {
                      controller.requestPermission();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadImage(File file) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Image.file(file, fit: BoxFit.cover),
    );
  }

  Widget _emptyImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: const Center(
          child: Text('Select an Image'),
        ),
      ),
    );
  }
}
