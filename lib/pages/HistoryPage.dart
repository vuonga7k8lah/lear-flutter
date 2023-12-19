import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/HistoryController.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HistoryController historyController = Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: Center(
        child:  GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: historyController.dataImage.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(historyController.dataImage[index]),
              );
            })
      ),
    );
  }
}
