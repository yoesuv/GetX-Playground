import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockController extends GetxController {
  final dateTime = Rx<DateTime>(DateTime.now());
  final hour = Rx<String>('0');
  final minute = Rx<String>('0');
  final second = Rx<String>('0');
  final alarmDateTime = Rx<DateTime?>(null);

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      dateTime.value = now;
      hour.value = now.hour.toString().padLeft(2, '0');
      minute.value = now.minute.toString().padLeft(2, '0');
      second.value = now.second.toString().padLeft(2, '0');
    });
  }

  void setAlarmDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    alarmDateTime.value = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }
}
