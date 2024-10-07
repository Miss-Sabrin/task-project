import 'package:flutter/material.dart';
import 'package:my_project/screens/bottomNavigat/bottom_navigate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BottomNvbar());
  }
}
