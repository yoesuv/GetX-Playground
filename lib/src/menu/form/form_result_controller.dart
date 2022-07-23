import 'package:get/get.dart';
import 'package:my_getx_playground/src/core/models/form_model.dart';

class FormResultController extends GetxController {
  var formModel = Rx<FormModel?>(null);

  void initData(FormModel? formModel) {
    this.formModel.value = formModel;
  }
}
