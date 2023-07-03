import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/values/app_styles.dart';
import 'package:get_storage/get_storage.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  var storage = GetStorage();
  double valueSide = 5;

  _ControlPageState(){
    valueSide = storage.read('numberWord')??valueSide;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Setting'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              storage.write('numberWord', valueSide);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'How much a number word at once?',
                style: TextStyle(fontFamily: FontFamily.sen, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Text('${valueSide.toInt()}',
                style: TextStyle(
                    fontSize: 150,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Side to set:',
                style: AppStyles.h5.copyWith(color: Colors.black),
              ),
            ),
            Slider(
                value: valueSide,
                max: 100,
                min: 1,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    valueSide = value;
                  });

                })
          ],
        ),
      ),
    );
  }
}
