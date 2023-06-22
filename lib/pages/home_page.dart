import 'dart:ui';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/controll_page.dart';
import 'package:my_app/values/app_styles.dart';
import 'package:my_app/widgets/app_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:english_words/english_words.dart';

import '../model/english_today.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late List<EnglishToday> data = [];
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  List<String> handleRandomWord(int limit) {
    List<String> data = [];
    Random random = Random();
    for (int i = 0; i < limit; i++) {
      int number = random.nextInt(100);
      data.add(nouns[number]);
    }
    return data;
  }

  handleGetData() {
    return handleRandomWord(10)
        .map((e) => EnglishToday(
            text: e,
            id: UniqueKey().toString(),
            quote:
                'thanks, i know, I will make an additional check the list of existing uuids'))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    data = handleGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('English today'),
        leading:
            IconButton(onPressed: () {
              _scaffoldkey.currentState?.openDrawer();
            }, icon: Icon(Icons.reorder_rounded)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_ic_call))],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                  height: size.height * 1 / 10,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sorry to take a lot of time. I have received your questions. I will try to have feedback for you soon.",
                    style: AppStyles.h5
                        .copyWith(color: Colors.black, fontSize: 12),
                  )),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                itemCount: 10,
                controller: controller,
                itemBuilder: (context, index) {
                  var firstText =
                      data[index].text?.substring(0, 1).toUpperCase();
                  var secondText = data[index].text?.substring(1);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 40,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: firstText,
                                style: TextStyle(
                                    fontSize: 100,
                                    fontFamily: FontFamily.sen,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(3, 6))
                                    ]),
                                children: [
                                  TextSpan(
                                      text: secondText,
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontFamily: FontFamily.sen,
                                        shadows: [],
                                      ))
                                ]),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 24),
                              child: Text(
                                data[index].quote ?? '',
                                style: AppStyles.h3
                                    .copyWith(fontSize: 40, letterSpacing: 1),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              count: 5,
              effect: const ScrollingDotsEffect(
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3,
                maxVisibleDots: 5,
                radius: 8,
                spacing: 10,
                dotHeight: 12,
                dotWidth: 12,
              ),
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            data = handleGetData();
          });
        },
        child: Icon(Icons.restart_alt_outlined),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.cyanAccent.shade200,
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child: Text(
                      'Your mind',
                      style: AppStyles.h3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BtnApp(label: "Favorites",onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const ControlPage()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
