import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/user_model.dart';
import 'package:my_getx_playground/src/core/repositories/user_repository.dart';

class NetworkingController extends GetxController {
  final _userRepository = GetInstance().find<UserRepository>();

  var listUser = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getListUser();
  }

  void _getListUser() async {
    try {
      final result = await _userRepository.getUsers();
      listUser.value = result;
    } catch (e) {
      debugPrint(
        'NetworkingController # error _getListUser $e',
        wrapWidth: 1024,
      );
    }
  }
}
