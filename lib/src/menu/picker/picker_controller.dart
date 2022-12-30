import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PickerController extends GetxController {
  final storagePermission = Rx<PermissionStatus>(PermissionStatus.denied);
  final imageFile = Rx<File?>(null);

  @override
  void onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt < 33) {
        storagePermission.value = await Permission.storage.status;
      } else {
        storagePermission.value = await Permission.photos.status;
      }
    } else {
      storagePermission.value = await Permission.storage.status;
    }
  }

  void requestPermission() async {
    late PermissionStatus request;
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt < 33) {
        request = await Permission.storage.request();
      } else {
        request = await Permission.photos.request();
      }
    } else {
      request = await Permission.storage.request();
    }
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
