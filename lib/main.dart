import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_getx_playground/src/core/data/constants.dart';
import 'package:my_getx_playground/src/core/notifications/notification_api.dart';
import 'package:my_getx_playground/src/my_app.dart';
import 'package:my_getx_playground/src/utils/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(myStorage);
  runApp(const MyApp());
}

// this function called in clock controller
void runMainAlarm() async {
  final prefs = await PreferencesUtil.instance;
  prefs.remove(keyMyAlarm);
  final strNow = DateTime.now().toIso8601String();
  debugPrint('Main # one shot at : $strNow');
  NotificationApi.showNotification(title: 'Alarm', body: 'Time $strNow');
}
