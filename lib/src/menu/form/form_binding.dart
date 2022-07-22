import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/form/form_controller.dart';

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormController());
  }
}
