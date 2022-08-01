import 'package:flutter/material.dart';
import 'package:peaceful_night/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaceful Night',
      theme: ThemeData(fontFamily: 'Colendra'),
      home: const HomePage(),
    );
  }
}
