import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_getx_playground/src/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(const MyApp());

  // setup alarm
  const int helloAlarmID = 0;
  //await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, printHelloWorld);
}

void printHelloWorld() {
  final now = DateTime.now();
  final int isolatedId = Isolate.current.hashCode;
  debugPrint('Main # $now, Hello World!, isolated $isolatedId function $printHelloWorld');
}