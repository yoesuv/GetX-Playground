import 'dart:isolate';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/notifications/notification_api.dart';
import 'package:my_getx_playground/src/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await FlutterDownloader.initialize(debug: false, ignoreSsl: true);
  FlutterDownloader.registerCallback(downloadCallback);
  runApp(const MyApp());

  // setup alarm
  try {
    final prefs = await SharedPreferences.getInstance();
    final strDate = prefs.getString(keyMyAlarm);
    if (strDate != null) {
      if (strDate.isNotEmpty) {
        final alarmDate = DateTime.parse(strDate);
        debugPrint('Main # setup alarm at $alarmDate');
        const int helloAlarmID = 0;
        await AndroidAlarmManager.oneShotAt(
          alarmDate,
          helloAlarmID,
          printHelloWorld,
        );
      }
    }
  } catch (e) {
    debugPrint('Main # error setup alarm $e');
  }
}

void printHelloWorld() async {
  final now = DateTime.now();
  final int isolatedId = Isolate.current.hashCode;
  debugPrint(
      'Main # $now, Hello World!, isolated $isolatedId function $printHelloWorld');
  final prefs = await SharedPreferences.getInstance();
  NotificationApi.showNotification(title: 'Alarm', body: '$now');
  prefs.setString(keyMyAlarm, '');
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
