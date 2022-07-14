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
    return Stack(
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
        )
      ],
    );
  }
}