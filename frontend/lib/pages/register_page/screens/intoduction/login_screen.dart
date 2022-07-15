import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/register_page/register_model.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom+40
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              heightFactor: 0.3,
              child:  Center(
                child: Text('Вход', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),),
              )
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTheme().light_field_background,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppTheme().light_field_border),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Почта',
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTheme().light_field_background,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppTheme().light_field_border),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Пароль',
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<RegisterModel>(
                builder: (_, model, __) =>
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                model.currentPage = 2;
                              },
                              child: Text('Забыл пароль')
                          ),
                        ),
                        LocalHero(
                            tag: 'enter',
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed('/testPage');
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(0),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(AppTheme().buttonBorderRadius)
                                        )
                                    )
                                ),
                                child: Center(
                                  child: Text('Войти', overflow: TextOverflow.fade,),
                                ),
                              ),
                            )
                        )
                      ],
                    )
            ),
          ),
        ],
      ),
    );
  }
}