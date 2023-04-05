import 'package:datepicker/clock.dart';
import 'package:datepicker/DateDifeerence_project.dart';
import 'package:datepicker/DatePicker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,darkTheme: ThemeData.dark(),

      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Clock(),
    );
  }
}

