import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/debug_page/debug_page.dart';
import 'package:frontend/pages/home_page/home_page.dart';
import 'package:frontend/pages/register_page/register_page.dart';
import 'package:material_color_generator/material_color_generator.dart';

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
        primarySwatch: generateMaterialColor(color: AppTheme().accent),
      ),
      routes: {
        '/debugPage': (context) => DebugPage(),
        '/registerPage': (context) => RegisterPage(),
        '/homePage': (context) => HomePage()
      },
      initialRoute: '/debugPage',
    );
  }
}