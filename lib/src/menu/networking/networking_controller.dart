import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/user_model.dart';
import 'package:my_getx_playground/src/core/repositories/user_repository.dart';

class NetworkingController extends GetxController
    with StateMixin<List<UserModel>> {
  final _userRepository = GetInstance().find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    _getListUser();
  }

  void _getListUser() async {
    try {
      final result = await _userRepository.getUsers();
      change(result, status: RxStatus.success());
    } catch (e) {
      debugPrint(
        'NetworkingController # error _getListUser $e',
        wrapWidth: 1024,
      );
      change([], status: RxStatus.error('$e'));
    }
  }
}
