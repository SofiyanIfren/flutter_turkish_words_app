import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MultiWindowApp());
}

class MultiWindowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Turkish App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
