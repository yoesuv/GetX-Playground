import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static final routeName = '/counter';
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('CounterScreen'),
        ),
      ),
    );
  }
}
