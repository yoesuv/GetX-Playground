import 'package:my_getx_playground/src/core/models/post_model.dart';
import 'package:my_getx_playground/src/core/networks/base_service.dart';

class PostRepository extends BaseService {
  Future<List<PostModel>> getPosts({
    required int start,
    int limit = 20,
  }) async {
    final response = await get('posts?_start=$start,_limit=$limit');
    if (response.isOk) {
      return PostModel.buildListFromJson(response.body);
    } else {
      return [];
    }
  }
}
