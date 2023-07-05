import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/utils/app_snackbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

enum DownloadChannel {
  downloader,
  dio,
}

class DownloadController extends GetxController {
  final storagePermission = Rx<PermissionStatus>(PermissionStatus.denied);
  final sdkInt = Rx<int>(0);

  @override
  void onInit() async {
    super.onInit();
    storagePermission.value = await Permission.storage.status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;
    this.sdkInt.value = sdkInt;
  }

  void requestPermission(DownloadChannel channel) async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;
    if (sdkInt >= 33) {
      downloadFile(channel);
    } else {
      final request = await Permission.storage.request();
      storagePermission.value = request;
      if (request == PermissionStatus.granted) {
        downloadFile(channel);
      }
    }
  }

  void downloadFile(DownloadChannel channel) async {
    debugPrint('DownloadController # download link : $linkPdf');
    try {
      Directory? directory;
      if (Platform.isAndroid) {
        File file = File(linkPdf);
        final fileName = basename(file.path);
        final now = DateTime.now();
        final strDay = '${now.day}'.padLeft(2, '0');
        final strMonth = '${now.month}'.padLeft(2, '0');
        final strMsEpoch = '${now.millisecondsSinceEpoch}';
        final strDateTime = '$strDay-$strMonth-${now.year}-$strMsEpoch';
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
        final strFileName = '$strDateTime-$fileName';
        debugPrint('DownloadController # final file name : $strFileName');
        if (channel == DownloadChannel.downloader) {
          // download using flutter downloader
          snackBarError('Download', 'No Downloader');
        } else {
          // download using dio
          Dio().download(
            linkPdf,
            '${directory?.path}/$strFileName',
            onReceiveProgress: (count, total) {
              debugPrint('DownloadController # $count/$total');
              if (count == total) {
                snackBarSuccess('Download', 'Download Finished');
              }
            },
          );
        }
      } else {
        snackBarWarning('Download', 'Android Only');
      }
    } catch (error) {
      debugPrint('DownloadController # error $error');
      snackBarError('Download', 'Download Failed');
    }
  }
}
