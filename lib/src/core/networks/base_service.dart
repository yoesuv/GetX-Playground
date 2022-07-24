import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://tayolakunle.medium.com/network-request-with-getconnect-in-flutter-4d7c5d7c0309
class BaseService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    httpClient.timeout = const Duration(seconds: 30);
    httpClient.addResponseModifier((request, response) async {
      debugPrint('${response.body}', wrapWidth: 1024);
    });
  }
}
