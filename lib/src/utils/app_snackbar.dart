import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarSuccess(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: const Color(0xFF4CAF50),
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 16,
      left: 16,
      right: 16,
    ),
  );
}

void snackBarWarning(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: const Color(0xFFFFC107),
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 16,
      left: 16,
      right: 16,
    ),
  );
}

void snackBarError(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: const Color(0xFFF44336),
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 16,
      left: 16,
      right: 16,
    ),
  );
}