import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/form/form_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class FormScreen extends GetView<FormController> {
  static const routeName = '/form';
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _textFieldEmail(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
        child: MyButton(
          label: 'Submit',
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Obx(
      () => TextField(
        controller: controller.emailController,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'youremail@mail.com',
          errorText: controller.emailError.value,
        ),
        onChanged: (value) => controller.validateEmail(value),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
