import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/counter/counter_controller.dart';

class CounterScreen extends GetView<CounterController> {
  static const routeName = '/counter';
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _textCounter(),
                _counterAction(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textCounter() {
    return Text(
      '${controller.count}',
      style: const TextStyle(
        fontSize: 150,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _counterAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MaterialButton(
          color: Colors.teal,
          onPressed: () {
            controller.decrement();
          },
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        MaterialButton(
          color: Colors.teal,
          onPressed: () {
            controller.increment();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
