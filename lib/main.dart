import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff29303B),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: Bmi(),
    );
  }
}
