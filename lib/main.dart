import 'package:flutter/material.dart';
import 'package:nda_proverb_project/theme.dart';
import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proverb',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
