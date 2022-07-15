import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/home_page.dart';
import 'package:frontend/pages/home_page/screens/goal_screen/widgets/goal_card.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';
import 'package:provider/provider.dart';

import 'goal.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {

  List<Goal> goals = [
  Goal(
  'Поступить в вуз',
  'Сдать ЕГЭ на высокий балл, выбрать технический вуз, выбрать IT направление в нем и сдать внутренние экзамены, где необходимо.',
  '15 июля',
  ['Образование'],
  'assets/images/university.png'),
    Goal(
        'Стать Илоном Маском',
        'Стать Илоном Маском и улететь с этого мира на Марс',
        '21 июня',
        ['Учеба', 'Работа'],
        'assets/images/ilon.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
        builder: (_, model, __) => GestureDetector(
              onTap: () => model.currentIndex = 6,
              child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: SizedBox(
                          height: 45,
                          child: Search(),
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Цели',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 22),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: goals.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 7),
                                      child: GoalCard(
                                          goal: goals[index]),
                                    ))
                          ],
                        ),
                      ))
                    ],
                  )),
            ));
  }
}
