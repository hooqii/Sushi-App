import 'package:flutter/material.dart';
import 'package:sushi_app/pages/home.dart';
import 'package:sushi_app/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Intro(),
      routes: {
        '/intro_page':(context) => const Intro(),
        '/home_page':(context) => const Home()
      },
    );
  }
}
