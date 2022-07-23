import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_getx_playground/src/core/bindings/app_bindings.dart';
import 'package:my_getx_playground/src/core/models/form_model.dart';
import 'package:my_getx_playground/src/menu/counter/counter_screen.dart';
import 'package:my_getx_playground/src/menu/form/form_result_screen.dart';
import 'package:my_getx_playground/src/menu/form/form_screen.dart';
import 'package:my_getx_playground/src/menu/home/home_screen.dart';

final List<GetPage> appRoute = [
  GetPage(
    name: '/',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: CounterScreen.routeName,
    page: () => const CounterScreen(),
    binding: CounterBinding(),
  ),
  GetPage(
    name: FormScreen.routeName,
    page: () => const FormScreen(),
    binding: FormBinding(),
  ),
  GetPage(
    name: FormResultScreen.routeName,
    page: () {
      final args = Get.arguments as FormModel;
      return FormResultScreen(formModel: args);
    },
    binding: FormResultBinding(),
  ),
];
