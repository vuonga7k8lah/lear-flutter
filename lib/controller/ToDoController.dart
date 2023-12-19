import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../model/todolist.dart';

class TodoController extends GetxController{
  var todoData = <ToDo>[].obs;

  void add(ToDo n) {
    todoData.add(n);
  }
  @override
  void onInit() {
    GetStorage().write('todo',getData());
    List? storedNotes= GetStorage().read<List>('todo');

    if(storedNotes!.isEmpty){
      todoData =storedNotes.map((e) => ToDo.fromJson(e)).toList().obs;
    }
    ever(todoData, (_){
      GetStorage().write('notes',getData());
    });
    super.onInit();
  }
  getData(){
    return[
      new ToDo('name', 'content','1'),
      new ToDo('name1', 'content','1'),
      new ToDo('name2', 'content','0'),
    ];
  }
}