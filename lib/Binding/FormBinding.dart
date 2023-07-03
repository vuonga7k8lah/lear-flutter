import 'package:get/get.dart';
import 'package:my_app/controller/FormController.dart';

class FormBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FormController());
  }
}