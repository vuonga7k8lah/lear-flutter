import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/values/app_styles.dart';

class BtnApp extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const BtnApp({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontFamily: FontFamily.sen),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: Size(double.infinity,20),
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
