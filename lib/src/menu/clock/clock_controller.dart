import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/main.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/notifications/notification_api.dart';
import 'package:my_getx_playground/src/utils/preference_utils.dart';

class ClockController extends GetxController {
  final dateTime = Rx<DateTime>(DateTime.now());
  final hour = Rx<String>('0');
  final minute = Rx<String>('0');
  final second = Rx<String>('0');
  final alarmDateTime = Rx<DateTime?>(null);

  @override
  void onInit() async {
    super.onInit();
    AndroidAlarmManager.initialize();
  }

  void initAlarmDateTime() async {
    final prefs = await PreferencesUtil.instance;
    final strDate = prefs.getString(keyMyAlarm);
    try {
      if (strDate == null) {
        alarmDateTime.value = null;
      } else if (strDate.isEmpty) {
        alarmDateTime.value = null;
      } else {
        debugPrint('ClockController # pref date : $strDate');
        final alarmDate = DateTime.parse(strDate);
        alarmDateTime.value = alarmDate;
      }
    } catch (e) {
      debugPrint('ClockController # error parse $e');
      alarmDateTime.value = null;
    }
  }

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      dateTime.value = now;
      hour.value = now.hour.toString().padLeft(2, '0');
      minute.value = now.minute.toString().padLeft(2, '0');
      second.value = now.second.toString().padLeft(2, '0');
    });
  }

  void setAlarmDateTime(TimeOfDay timeOfDay) async {
    final now = DateTime.now();
    final alarm = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    alarmDateTime.value = alarm;
    final prefs = await PreferencesUtil.instance;
    prefs.setString(keyMyAlarm, alarm.toIso8601String());
    await AndroidAlarmManager.oneShotAt(
      alarm,
      idMyAlarm,
      runMainAlarm,
      wakeup: true,
      rescheduleOnReboot: true,
    );
  }
}
