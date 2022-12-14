import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/notifications/notification_api.dart';
import 'package:my_getx_playground/src/my_app.dart';
import 'package:my_getx_playground/src/utils/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDownloader.initialize(debug: false, ignoreSsl: true);
    FlutterDownloader.registerCallback(downloadCallback);
  }
  await GetStorage.init(myStorage);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
void downloadCallback(
  String id,
  DownloadTaskStatus status,
  int progress,
) {
  debugPrint(
    'Callback on background isolate: '
    'task ($id) is in status ($status) and process ($progress)',
  );
  IsolateNameServer.lookupPortByName('downloader_send_port')
      ?.send([id, status, progress]);
}

// this function called in clock controller
void runMainAlarm() async {
  final prefs = await PreferencesUtil.instance;
  prefs.remove(keyMyAlarm);
  final strNow = DateTime.now().toIso8601String();
  debugPrint('Main # one shot at : $strNow');
  NotificationApi.showNotification(title: 'Alarm', body: 'Time $strNow');
}
