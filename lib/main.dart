import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookHomePage(),
    );
  }
}
