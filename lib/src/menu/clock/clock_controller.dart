import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();
    final strDate = prefs.getString(keyMyAlarm);
    if (strDate != null) {
      if (strDate.isNotEmpty) {
        debugPrint('ClockController # $strDate');
        try {
          final alarmDate = DateTime.parse(strDate);
          alarmDateTime.value = alarmDate;
        } catch (e) {
          debugPrint('ClockController # error parse $e');
          alarmDateTime.value = null;
        }
      }
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
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(keyMyAlarm, alarm.toIso8601String());
    await AndroidAlarmManager.oneShotAt(
      alarm,
      idMyAlarm,
      _runAlarm,
      wakeup: true,
      rescheduleOnReboot: true,
    );
  }

  void _runAlarm() async {
    final now = DateTime.now();
    debugPrint('ClockController # one shot at : ${now.toIso8601String()}');
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(keyMyAlarm, '');
  }
}
