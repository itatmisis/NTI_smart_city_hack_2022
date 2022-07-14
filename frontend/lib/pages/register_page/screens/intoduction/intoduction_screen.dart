import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

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
          left: 10,
          right: 10,
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom
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
                currentIndex != 0? TextButton(
                    onPressed: () {
                      setState(() {
                        currentIndex--;
                      });
                    },
                    child: Text('Назад')
                ) : SizedBox(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                    child: Text('Далее')
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