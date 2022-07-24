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
          child: _buildList(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Obx(
      () => ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 12),
        itemCount: controller.listUser.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Text(controller.listUser[index].name ?? '-'),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
