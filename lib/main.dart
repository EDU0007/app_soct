import 'package:app/pages/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String titulo = 'appp';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titulo,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
      },
    );
  }
}
