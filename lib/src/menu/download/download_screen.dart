import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/download/download_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadScreen extends GetView<DownloadController> {
  static const routeName = '/download';
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Download File'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text('Download File .pdf'),
              const SizedBox(height: 12),
              Text('Permission : ${controller.storagePermission.value.name}'),
              const SizedBox(height: 12),
              Center(
                child: MyButton(
                  label: 'Download pdf',
                  onPressed: () {
                    if (controller.storagePermission.value ==
                        PermissionStatus.granted) {
                      controller.downloadFile(DownloadChannel.downloader);
                    } else {
                      controller.requestPermission(DownloadChannel.downloader);
                    }
                  },
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: MyButton(
                  label: 'Download pdf (dio)',
                  onPressed: () {
                    if (controller.storagePermission.value ==
                        PermissionStatus.granted) {
                      controller.downloadFile(DownloadChannel.dio);
                    } else {
                      controller.requestPermission(DownloadChannel.dio);
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
}
