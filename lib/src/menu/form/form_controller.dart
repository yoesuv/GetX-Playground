import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();

  var emailError = Rx<String?>(null);
  var fullNameError = Rx<String?>(null);

  void validateFullName(String value) {
    if (value.isEmpty) {
      fullNameError.value = 'Full Name is empty';
    } else if (GetUtils.isLowerThan(value.length, 2)) {
      fullNameError.value = 'Full Name is not valid';
    } else if (GetUtils.isGreaterThan(value.length, 150)) {
      fullNameError.value = 'Full Name is not valid';
    } else {
      fullNameError.value = null;
    }
  }

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
    fullNameController.dispose();
  }
}
