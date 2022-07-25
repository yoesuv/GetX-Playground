import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    httpClient.timeout = const Duration(seconds: 30);
    httpClient.addResponseModifier((request, response) async {
      final headers = response.request?.headers;
      final method = response.request?.method.toUpperCase();
      final url = response.request?.url;
      debugPrint('BaseService # headers : $headers');
      debugPrint('BaseService # response URL : $method $url');
      printWrapped('${response.body}');
      return response;
    });
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
