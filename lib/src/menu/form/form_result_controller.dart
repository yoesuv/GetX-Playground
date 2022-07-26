import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/arguments/form_arguments.dart';

class FormResultController extends GetxController {
  final formModel = Rx<FormArguments?>(null);

  void initData(FormArguments? formModel) {
    this.formModel.value = formModel;
  }
}
