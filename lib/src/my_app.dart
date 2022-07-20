import 'package:flutter/material.dart';
import 'package:my_getx_playground/src/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}