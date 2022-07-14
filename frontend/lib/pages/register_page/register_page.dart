import 'package:flutter/material.dart';

import 'screens/intoduction/intoduction_screen.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: IntoductionScreen(),
      ),
    );
  }

}