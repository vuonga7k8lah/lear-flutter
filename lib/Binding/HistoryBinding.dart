import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/HistoryController.dart';
import '../main.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}