import 'dart:async';

import 'package:get/get.dart';

class ClockController extends GetxController {
  final dateTime = Rx<DateTime>(DateTime.now());

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime.value = DateTime.now();
    });
  }
}
