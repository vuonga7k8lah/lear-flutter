import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/values/app_colors.dart';
import 'package:my_app/values/app_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Welcome To',
                style: AppStyles.h3,
              ),
            )),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'English',
                          style: AppStyles.h2.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            'Qoutes',
                            textAlign: TextAlign.left,
                            style: AppStyles.h4,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(bottom: 72),
              child: RawMaterialButton(
                onPressed: (){
                  Get.offAll(HomePage());
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomePage()), (route) => false);
                },
               child: const Icon(Icons.arrow_forward_ios_rounded),
                fillColor: Colors.grey,
                shape: CircleBorder(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
