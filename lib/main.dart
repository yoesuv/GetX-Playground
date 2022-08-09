import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/notifications/notification_api.dart';
import 'package:my_getx_playground/src/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
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
