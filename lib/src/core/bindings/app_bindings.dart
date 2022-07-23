import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/counter/counter_controller.dart';
import 'package:my_getx_playground/src/menu/form/form_controller.dart';
import 'package:my_getx_playground/src/menu/form/form_result_controller.dart';

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
