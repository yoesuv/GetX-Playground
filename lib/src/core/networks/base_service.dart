import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    httpClient.timeout = const Duration(seconds: 30);
  }

  void printWrapped(String text) {
    final RegExp pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach(
          (RegExpMatch match) => debugPrint(
            match.group(0),
            wrapWidth: 1024,
          ),
        );
  }
}
