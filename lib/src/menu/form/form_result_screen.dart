import 'package:flutter/material.dart';

class FormResultScreen extends StatelessWidget {
  static const routeName = '/form_result';
  const FormResultScreen({Key? key}) : super(key: key);

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
              SizedBox(height: 24),
              Text('Full Name'),
              SizedBox(height: 12),
              Text('Email'),
            ],
          ),
        ),
      ),
    );
  }
}
