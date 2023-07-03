import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBlog extends StatefulWidget {
  const DetailBlog({super.key});

  @override
  State<DetailBlog> createState() => _DetailBlogState();
}

class _DetailBlogState extends State<DetailBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Blog')),
      body: Container(
        child: Text('xxx'),
      ),
    );
  }
}
