import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Calculator',
      theme: ThemeData(
        fontFamily: 'Lato', // Set default font
      ),
      home: const LoginPage(),
    );
  }
}