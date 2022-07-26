import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/infinite_scroll/infinite_scroll_controller.dart';

class InfiniteScrollScreen extends GetView<InfiniteScrollController> {
  static const routeName = '/infinite_scroll';
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Infinite Scroll'),
        ),
      ),
    );
  }
}
