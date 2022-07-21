import 'package:flutter/material.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class FormScreen extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 12),
        child: MyButton(
          label: 'Submit',
          onPressed: () {},
        ),
      ),
    );
  }
}
