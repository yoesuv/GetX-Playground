import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/post_model.dart';
import 'package:my_getx_playground/src/core/repositories/post_repository.dart';

class InfiniteScrollController extends GetxController
    with StateMixin<List<PostModel>> {
  PostRepository? postRepository;

  InfiniteScrollController({this.postRepository});

  @override
  void onInit() {
    super.onInit();
    _getPosts();
  }

  void _getPosts() async {
    try {
      final result = await postRepository?.getPosts(start: 1);
      change(result, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Failed get posts'));
    }
  }
}
