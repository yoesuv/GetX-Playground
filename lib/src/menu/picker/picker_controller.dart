import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PickerController extends GetxController {
  final storagePermission = Rx<PermissionStatus>(PermissionStatus.denied);

  @override
  void onInit() async {
    super.onInit();
    storagePermission.value = await Permission.storage.status;
  }

  void requestPermission() async {
    final request = await Permission.storage.request();
    storagePermission.value = request;
  }
}
