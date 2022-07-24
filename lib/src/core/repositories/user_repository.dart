import 'package:my_getx_playground/src/core/models/user_model.dart';
import 'package:my_getx_playground/src/core/networks/base_service.dart';

class UserRepository extends BaseService {
  Future<List<UserModel>> getUsers() async {
    final response = await get('users');
    if (response.isOk) {
      return UserModel.buildListFromJson(response.body);
    } else {
      return <UserModel>[];
    }
  }
}
