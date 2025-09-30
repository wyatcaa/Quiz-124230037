import 'package:flutter/material.dart';
import 'package:quis_124230037/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis',
      theme: ThemeData(
          primaryColor: const Color(0xFFFE7F2D), 
          scaffoldBackgroundColor: const Color(0xFFFAF9F6), 
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF233D4D)), 
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF233D4D), 
          ),
        ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

