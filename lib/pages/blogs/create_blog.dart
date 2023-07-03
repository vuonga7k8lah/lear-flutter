import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/BlogController.dart';
import 'list_blog.dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GetBuilder<BlogController>(builder: (blog) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create Blog'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: titleController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.terminal_sharp),
                    hintText: 'Enter Title',
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The Title is not empty.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: descController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.description),
                    hintText: 'Enter a description',
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: imgController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.image),
                    hintText: 'Enter your link image',
                    labelText: 'Image',
                  ),
                ),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text('label'),
                //         DropdownButtonFormField(
                //           value: "USA",
                //           decoration: InputDecoration(
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.blue, width: 2),
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //             border: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.blue, width: 2),
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //             filled: true,
                //             fillColor: Colors.blueAccent,
                //           ),
                //           hint: Text('Status:'),
                //           items: [
                //             DropdownMenuItem(child: Text("USA"), value: "USA"),
                //             DropdownMenuItem(child: Text("Canada"), value: "Canada"),
                //             DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
                //             DropdownMenuItem(
                //                 child: Text("England"), value: "England"),
                //           ],
                //           onChanged: (Object? value) {},
                //         )
                //       ],
                //     )
                // ),
                Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    //alignment: Alignment.center,
                    child: ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        var body = {
                          'title': titleController.text,
                          'desc': descController.text,
                          'image': imgController.text,
                          'status': 1
                        };
                        Future<Response> resp = blog.create(body);
                        Response response = (await resp);
                        Fluttertoast.showToast(
                            msg: 'Create Blog title ' + response.body['title']);
                        blog.getData();
                        Get.off(ListBlog());

                        // Get.dialog(
                        //   AlertDialog(
                        //     title: const Text('Dialog'),
                        //     content: const Text('This is a dialog'),
                        //     actions: [
                        //       TextButton(
                        //         child: const Text("Close"),
                        //         onPressed: () => Get.back(),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                    )),
              ],
            ),
          )),
        ),
      );
    });
  }
}
