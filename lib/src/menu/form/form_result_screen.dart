import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/form_model.dart';
import 'package:my_getx_playground/src/menu/form/form_result_controller.dart';

class FormResultScreen extends GetView<FormResultController> {
  static const routeName = '/form_result';
  final FormModel? formModel;
  const FormResultScreen({Key? key, this.formModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget _textFullNameValue() {
    return Text('${formModel?.fullName}');
  }

  Widget _textEmailValue() {
    return Text('${formModel?.email}');
  }
}
