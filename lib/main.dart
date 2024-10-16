import 'package:expenses_calculator/screens/homepage.dart';
import 'package:expenses_calculator/screens/register_page.dart';
import 'package:expenses_calculator/screens/wallet_detail_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/walletDetail': (context) => WalletDetailPage(),
      },
      theme: ThemeData(
        fontFamily: 'Lato', // Set default font
      ),
    );
  }
}