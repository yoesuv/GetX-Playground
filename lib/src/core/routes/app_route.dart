import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_getx_playground/src/core/bindings/app_bindings.dart';
import 'package:my_getx_playground/src/core/arguments/form_arguments.dart';
import 'package:my_getx_playground/src/menu/clock/clock_screen.dart';
import 'package:my_getx_playground/src/menu/counter/counter_screen.dart';
import 'package:my_getx_playground/src/menu/download/download_screen.dart';
import 'package:my_getx_playground/src/menu/form/form_result_screen.dart';
import 'package:my_getx_playground/src/menu/form/form_screen.dart';
import 'package:my_getx_playground/src/menu/home/home_screen.dart';
import 'package:my_getx_playground/src/menu/infinite_scroll/infinite_scroll_screen.dart';
import 'package:my_getx_playground/src/menu/networking/networking_screen.dart';
import 'package:my_getx_playground/src/menu/picker/picker_screen.dart';
import 'package:my_getx_playground/src/menu/storage/storage_screen.dart';

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
      final args = Get.arguments as FormArguments;
      return FormResultScreen(formModel: args);
    },
    binding: FormResultBinding(),
  ),
  GetPage(
    name: NetworkingScreen.routeName,
    page: () => const NetworkingScreen(),
    binding: NetworkingBinding(),
  ),
  GetPage(
    name: PickerScreen.routeName,
    page: () => const PickerScreen(),
    binding: PickerBinding(),
  ),
  GetPage(
    name: InfiniteScrollScreen.routeName,
    page: () => const InfiniteScrollScreen(),
    binding: InfiniteScrollBinding(),
  ),
  GetPage(
    name: ClockScreen.routeName,
    page: () => const ClockScreen(),
    binding: ClockBinding(),
  ),
  GetPage(
    name: DownloadScreen.routeName,
    page: () => const DownloadScreen(),
    binding: DownloadBinding(),
  ),
  GetPage(
    name: StorageScreen.routeName,
    page: () => const StorageScreen(),
    binding: StorageBinding(),
  ),
];
