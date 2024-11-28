import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_project/Screens/api_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intern Project',
      home: ProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
