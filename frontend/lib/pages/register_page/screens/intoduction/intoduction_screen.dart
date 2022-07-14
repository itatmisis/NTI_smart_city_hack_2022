import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/register_page/register_model.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

class IntoductionScreen extends StatefulWidget {


  const IntoductionScreen({Key? key}) : super(key: key);

  @override
  State<IntoductionScreen> createState() => _IntoductionScreenState();
}

class _IntoductionScreenState extends State<IntoductionScreen> {
  final List<Widget> screens = [
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Будь среди первых, кто всё изменит')
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Будь среди первых, кто всё изменит2')
      ],
    ),
  ];

  int currentIndex = 0;

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
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                child: SizedBox(
                  child: screens[currentIndex],
                  key: ValueKey(currentIndex),
                ),
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex != 0? LocalHero(
                    tag: 'register',
                    child: SizedBox(
                      height: 50,
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentIndex--;
                            });
                          },
                          child: Text('Назад')
                      ),
                    )
                )
                    : SizedBox(),
                Consumer<RegisterModel>(
                  builder: (_, model, __) =>
                      LocalHero(
                          tag: 'enter',
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (currentIndex == screens.length-1) {
                                    model.currentPage = 1;
                                  } else {
                                    currentIndex++;
                                  }
                                });
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
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: DotsIndicator(
              dotsCount: screens.length,
              position: currentIndex.toDouble(),
            )
          )
        ],
      ),
    );
  }
}