import 'package:get/get.dart';
import 'package:my_app/controller/ToDoController.dart';

class TodoBidding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}