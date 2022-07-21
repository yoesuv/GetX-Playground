import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_getx_playground/src/menu/counter/counter_screen.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My GetX Playground'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: MyButton(
                    label: 'Counter',
                    onPressed: () {
                      Get.toNamed(CounterScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Form & Arguments',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
