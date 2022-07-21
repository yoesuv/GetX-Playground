import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.teal,
                    onPressed: () {},
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  MaterialButton(
                    color: Colors.teal,
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
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
}
