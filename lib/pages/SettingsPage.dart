import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/SettingsController.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(Get.find<SettingsController>().title.value),
            ),
            ElevatedButton(
              child: Text('Another Page'),
              onPressed: () => Get.toNamed('/another'),
            ),
          ],
        ),
      ),
    );
  }
}