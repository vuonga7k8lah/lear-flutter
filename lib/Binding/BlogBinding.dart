import 'package:get/get.dart';
import 'package:my_app/controller/BlogController.dart';
import 'package:my_app/controller/FormController.dart';

import '../api/api.dart';
import '../until/api.dart';

class BlogBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlogController(parser:Get.find()));
  }
}