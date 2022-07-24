import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/networking/networking_controller.dart';

class NetworkingScreen extends GetView<NetworkingController> {
  static const routeName = '/networking';
  const NetworkingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Networking'),
        ),
      ),
    );
  }
}