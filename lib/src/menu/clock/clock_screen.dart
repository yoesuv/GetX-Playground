import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  static const routeName = '/clock';
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock Screen'),
      ),
    );
  }
}