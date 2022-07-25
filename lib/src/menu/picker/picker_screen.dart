import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/picker/picker_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class PickerScreen extends GetView<PickerController> {
  static const routeName = '/picker';
  const PickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker Screen'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(
              label: 'Open Gallery',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
