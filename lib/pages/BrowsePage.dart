import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/BrowseController.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Browse')),
      body: Center(
        child: Container(
          child: Text(Get.find<BrowseController>().title.value),
        ),
      ),
    );
  }
}