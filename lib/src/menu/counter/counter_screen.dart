import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/counter/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  static const routeName = '/counter';
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _textCounter(counterController),
              _counterAction(counterController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textCounter(CounterController counterController) {
    return Obx(
      () => Text(
        '${counterController.count}',
        style: const TextStyle(
          fontSize: 150,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _counterAction(CounterController counterController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MaterialButton(
          color: Colors.teal,
          onPressed: () {
            counterController.decrement();
          },
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        MaterialButton(
          color: Colors.teal,
          onPressed: () {
            counterController.increment();
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
