import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/controller/ToDoController.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TodoController todoController = Get.put(TodoController());

  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: todoController.todoData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: todoController.todoData[index].status=='1',
                        onChanged: (bool? value) {
                          setState(() {
                            //todoController.todoData[index].setStatus();
                          });
                        },
                      ),
                      Column(
                        children: [
                          Text(todoController.todoData[index].name.toString()),
                          Text(todoController.todoData[index].content.toString())
                        ],
                      )
                    ],
                  )
                );
              }
          ),
      ),
        floatingActionButton: FloatingActionButton(
      onPressed: () {
        print(todoController.todoData);
      },
      child: const Icon(Icons.add),
      backgroundColor: Colors.green,
    )
    );
  }
}
