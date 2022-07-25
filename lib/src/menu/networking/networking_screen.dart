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
        child: controller.obx(
          (state) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 12),
              itemCount: state?.length ?? 0,
              itemBuilder: (context, index) {
                final user = state?[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 6,
                  ),
                  child: Text(user?.name ?? '-'),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: const Center(
            child: Text('No Data Found'),
          ),
          onError: (error) {
            return Center(
              child: Text(error ?? '-'),
            );
          },
        ),
      ),
    );
  }
}
