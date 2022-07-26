import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/post_model.dart';
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
        child: controller.obx(
          (state) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: state?.length ?? 0,
              itemBuilder: (context, index) {
                return _itemPost(state?[index]);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
        ),
      ),
    );
  }

  Widget _itemPost(PostModel? post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post?.title ?? '-',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            post?.body ?? '-',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
