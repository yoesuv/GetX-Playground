import 'package:my_getx_playground/src/core/models/user_model.dart';
import 'package:my_getx_playground/src/core/networks/base_service.dart';

class UserRepository extends BaseService {

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await get('users');
      return UserModel.buildListFromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

}