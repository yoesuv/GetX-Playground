import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/arguments/form_arguments.dart';
import 'package:my_getx_playground/src/menu/form/form_result_controller.dart';

class FormResultScreen extends GetView<FormResultController> {
  static const routeName = '/form_result';
  final FormArguments? formModel;
  const FormResultScreen({Key? key, this.formModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.initData(formModel);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Form Result Screen'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Full Name :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                _textFullNameValue(),
                const SizedBox(height: 12),
                const Text(
                  'Email : ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                _textEmailValue(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFullNameValue() {
    return Text(controller.formModel.value?.fullName ?? '-');
  }

  Widget _textEmailValue() {
    return Text(controller.formModel.value?.email ?? '-');
  }
}
