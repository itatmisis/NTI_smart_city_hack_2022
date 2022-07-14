import 'package:flutter/material.dart';
import 'package:frontend/pages/register_page/register_model.dart';
import 'package:frontend/pages/register_page/screens/intoduction/auth_screen.dart';
import 'package:frontend/pages/register_page/screens/intoduction/login_screen.dart';
import 'package:frontend/pages/register_page/screens/intoduction/register_screen.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

import 'screens/intoduction/intoduction_screen.dart';

class RegisterPage extends StatelessWidget {

  List<Widget> screens = [
    IntoductionScreen(),
    AuthScreen(),
    RegisterScreen(),
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<RegisterModel>(
          builder: (_, model, __) =>
              LocalHeroScope(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeIn,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Center(
                    child: screens[model.currentPage],
                  ),
                )
              )
        )
      ),
    );
  }

}