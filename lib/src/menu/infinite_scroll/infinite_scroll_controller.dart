import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/post_model.dart';
import 'package:my_getx_playground/src/core/repositories/post_repository.dart';

class InfiniteScrollController extends GetxController
    with StateMixin<List<PostModel>>, ScrollMixin {
  PostRepository? postRepository;

  List<PostModel> listPosts = <PostModel>[];
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;
  final isLoading = false.obs;

  InfiniteScrollController({this.postRepository});

  @override
  void onInit() {
    super.onInit();
    _getPosts(page);
  }

  @override
  Future<void> onEndScroll() async {
    debugPrint('InfiniteScrollController # onEndScroll');
    if (!lastPage) {
      page += 1;
      _getPosts(page);
    } else {
      Get.snackbar(
        'Infinite Scroll',
        'Last Page',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.amber,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      );
    }
  }

  @override
  Future<void> onTopScroll() async {
    debugPrint('InfiniteScrollController # onTopScroll');
  }

  Future<void> _getPosts(int page) async {
    try {
      isLoading.value = page == 1 ? false : true;
      final result = await postRepository?.getPosts(start: page);
      isLoading.value = false;
      final isEmptyPosts = result?.isEmpty ?? true;
      if (result != null) {
        if (!getFirstData && isEmptyPosts) {
          change([], status: RxStatus.empty());
        } else if (getFirstData && isEmptyPosts) {
          lastPage = true;
        } else {
          getFirstData = true;
          listPosts.addAll(result);
          change(listPosts, status: RxStatus.success());
        }
      } else {
        isLoading.value = false;
        change([], status: RxStatus.empty());
      }
    } catch (e) {
      isLoading.value = false;
      change([], status: RxStatus.error('Failed get posts'));
    }
  }
}
