import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

class DownloadController extends GetxController {
  final linkPdf =
      'https://file-examples.com/storage/fe522079b962f100d94fb66/2017/10/file-sample_150kB.pdf';
  final storagePermission = Rx<PermissionStatus>(PermissionStatus.denied);

  @override
  void onInit() async {
    super.onInit();
    storagePermission.value = await Permission.storage.status;
  }

  void requestPermission() async {
    final request = await Permission.storage.request();
    storagePermission.value = request;
    if (request == PermissionStatus.granted) {
      downloadFile();
    }
  }

  void downloadFile() async {
    debugPrint('DownloadController # download link : $linkPdf');
    Directory? directory;
    if (Platform.isAndroid) {
      try {
        File file = File(linkPdf);
        final fileName = basename(file.path);
        final now = DateTime.now();
        final strDay = '${now.day}'.padLeft(2,'0');
        final strMonth = '${now.month}'.padLeft(2,'0');
        final strMsEpoch = '${now.millisecondsSinceEpoch}';
        final strDateTime = '$strDay-$strMonth-${now.year}-$strMsEpoch';
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
        final strFileName = '$strDateTime-$fileName';
        debugPrint('DownloadController # final file name : $strFileName');
        await FlutterDownloader.enqueue(
          url: linkPdf,
          savedDir: directory?.path ?? '',
          showNotification: true,
          fileName: strFileName,
        );
      } catch (error) {
        debugPrint('DownloadController # error $error');
      }
    }
  }
}
