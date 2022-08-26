import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_getx_playground/src/menu/clock/clock_screen.dart';
import 'package:my_getx_playground/src/menu/counter/counter_screen.dart';
import 'package:my_getx_playground/src/menu/download/download_screen.dart';
import 'package:my_getx_playground/src/menu/form/form_screen.dart';
import 'package:my_getx_playground/src/menu/infinite_scroll/infinite_scroll_screen.dart';
import 'package:my_getx_playground/src/menu/networking/networking_screen.dart';
import 'package:my_getx_playground/src/menu/picker/picker_screen.dart';
import 'package:my_getx_playground/src/menu/storage/storage_screen.dart';
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
                    onPressed: () {
                      Get.toNamed(FormScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Networking',
                    onPressed: () {
                      Get.toNamed(NetworkingScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Picker',
                    onPressed: () {
                      Get.toNamed(PickerScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Infinite Scroll',
                    onPressed: () {
                      Get.toNamed(InfiniteScrollScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Clock',
                    onPressed: () {
                      Get.toNamed(ClockScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'Download',
                    onPressed: () {
                      Get.toNamed(DownloadScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: MyButton(
                    label: 'My Task',
                    onPressed: () {
                      Get.toNamed(StorageScreen.routeName);
                    },
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
