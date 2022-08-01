import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickerController extends GetxController {
  final storagePermission = Rx<PermissionStatus>(PermissionStatus.denied);
  final imageFile = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    storagePermission.value = await Permission.storage.status;
  }

  void requestPermission() async {
    final request = await Permission.storage.request();
    storagePermission.value = request;
    if (request == PermissionStatus.granted) {
      openGallery();
    }
  }

  void openGallery() async {
    final XFile? xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
    if (xFile != null) {
      imageFile.value = File(xFile.path);
    }
  }
}
