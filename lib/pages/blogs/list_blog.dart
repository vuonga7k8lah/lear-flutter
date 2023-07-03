import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/controller/BlogController.dart';

import '../form_page.dart';
import 'create_blog.dart';
import 'detail_blog.dart';

class ListBlog extends StatefulWidget {
  const ListBlog({super.key});

  @override
  State<ListBlog> createState() => _ListBlogState();
}

class _ListBlogState extends State<ListBlog> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogController>(builder: (blog){
      return Scaffold(
          appBar: AppBar(
            title: Text('List Blogs'),
            actions: [
              IconButton(onPressed: (){
              }, icon: Icon(Icons.access_alarm))
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: ListView.builder(
                itemCount: blog.blogList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index)
                {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Image.network(
                            blog.blogList[index].image.toString(),
                            alignment: Alignment.centerLeft,
                            height: 200,
                            width: 180,
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              blog.blogList[index].title.toString(),
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: false,
                              blog.blogList[index].desc.toString(),
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(onPressed: () {
                              Get.to(DetailBlog());
                            }, child: Text('Detail'))
                          ],
                        )
                      )
                    ],
                  );
                }
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(CreateBlog());
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green,
          )
      );
    });

  }
}
