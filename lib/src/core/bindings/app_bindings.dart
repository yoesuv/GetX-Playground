import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/repositories/post_repository.dart';
import 'package:my_getx_playground/src/core/repositories/user_repository.dart';
import 'package:my_getx_playground/src/menu/clock/clock_controller.dart';
import 'package:my_getx_playground/src/menu/counter/counter_controller.dart';
import 'package:my_getx_playground/src/menu/form/form_controller.dart';
import 'package:my_getx_playground/src/menu/form/form_result_controller.dart';
import 'package:my_getx_playground/src/menu/infinite_scroll/infinite_scroll_controller.dart';
import 'package:my_getx_playground/src/menu/networking/networking_controller.dart';
import 'package:my_getx_playground/src/menu/picker/picker_controller.dart';

class CounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
  }
}

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormController());
  }
}

class FormResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormResultController());
  }
}

class NetworkingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository());
    Get.put(
      NetworkingController(
        userRepository: Get.find<UserRepository>(),
      ),
    );
  }
}

class PickerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickerController());
  }
}

class InfiniteScrollBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostRepository());
    Get.put(
      InfiniteScrollController(
        postRepository: Get.find<PostRepository>(),
      ),
    );
  }
}

class ClockBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockController());
  }
}
