
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:my_app/parser/BlogParser.dart';

import '../api/api.dart';
import '../until/api.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => ApiService(appBaseUrl: AppConstants.api));
    Get.lazyPut(
            () =>
            BlogParser(
                apiService: Get.find()),
        fenix: true);
  }
}
