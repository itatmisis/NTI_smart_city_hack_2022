import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/register_page/register_model.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {


  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

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
              alignment: Alignment.center,
              child: Text('Остался последний шаг!\nПройдите регистрацию или войдите в аккаунт'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<RegisterModel>(
              builder: (_, model, __) =>
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LocalHero(
                          tag: 'register',
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                                onPressed: () {
                                  model.currentPage = 2;
                                },
                                child: Text('Регистрация')
                            ),
                          )
                      ),
                      LocalHero(
                          tag: 'enter',
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  model.currentPage = 3;
                                },
                                style: ButtonStyle(
                                    elevation: MaterialStateProperty.all<double>(0),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppTheme().buttonBorderRadius),
                                        )
                                    )
                                ),
                                child: Center(
                                  child: Text('Войти', overflow: TextOverflow.fade,),
                                )
                            ),
                          )
                      )
                    ],
                  )
            )
          ),
        ],
      ),
    );
  }
}