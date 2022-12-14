import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/arguments/form_arguments.dart';
import 'package:my_getx_playground/src/menu/form/form_controller.dart';
import 'package:my_getx_playground/src/menu/form/form_result_screen.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class FormScreen extends GetView<FormController> {
  static const routeName = '/form';
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _textFieldFullName(),
                const SizedBox(height: 12),
                _textFieldEmail(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buttonSubmit(),
      ),
    );
  }

  Widget _textFieldFullName() {
    return TextField(
      controller: controller.fullNameController,
      decoration: InputDecoration(
        labelText: 'Full Name',
        hintText: 'your full name',
        errorText: controller.fullNameError.value,
      ),
      onChanged: (value) => controller.validateFullName(value),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _textFieldEmail() {
    return TextField(
      controller: controller.emailController,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'youremail@mail.com',
        errorText: controller.emailError.value,
      ),
      onChanged: (value) => controller.validateEmail(value),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buttonSubmit() {
    final double bottomPadding = Platform.isAndroid ? 12 : 24;
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: bottomPadding),
      child: MyButton(
        height: 45,
        isEnabled: controller.isFormValid.value,
        label: 'Submit',
        onPressed: () {
          final args = FormArguments(
            fullName: controller.fullNameController.text,
            email: controller.emailController.text,
          );
          Get.toNamed(FormResultScreen.routeName, arguments: args);
        },
      ),
    );
  }
}
