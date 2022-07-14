import 'package:flutter/material.dart';
import 'package:frontend/pages/debug_page/debug_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник мечты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/debugPage': (context) => DebugPage()
      },
      initialRoute: '/debugPage',
    );
  }
}