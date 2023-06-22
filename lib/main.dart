
import 'package:flutter/material.dart';
import 'package:my_app/pages/landing_page.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme:ThemeData(
        primaryColor: Colors.blueAccent
      )
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title hello'),
        leading: IconButton(
          icon: Icon(Icons.accessibility),
          onPressed: (){
            print("abc");
          },
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            )
          ],
        ),
      )
    );
  }
}
