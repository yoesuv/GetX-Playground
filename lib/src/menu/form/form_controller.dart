import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final emailController = TextEditingController();
  var emailError = Rx<String?>(null);

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email is empty';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Email is not valid';
    } else {
      emailError.value = null;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
