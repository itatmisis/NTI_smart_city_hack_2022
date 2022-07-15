import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen/widgets/achivement.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen/widgets/progressCard.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';

import 'widgets/banner.dart';
import 'widgets/group_title.dart';

class AchivementScreen extends StatefulWidget {

  const AchivementScreen({Key? key}) : super(key: key);

  @override
  State<AchivementScreen> createState() => _AchivementScreenState();
}

class _AchivementScreenState extends State<AchivementScreen> {

  List<String> mini = ['Добро пожаловать!', 'Начинающий', 'Посмотрите на это!'];
  List<List<String>> full = [['Опытный', 'Выполнить 7 целей'], ['Пора действовать', 'Перевести мечту в цель'], ['Настоящий Мастер', 'Выполнить 15 целей'],['Самоанализ', 'Полностью пройти опрос'],];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 45,
              child: Search(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: CustomBanner(),
                        ),
                        GroupTitle(title: 'Достижения'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mini.length,
                        itemBuilder: (context, index) => Padding(
                          padding: index == 0? EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5) : EdgeInsets.all(5),
                          child: Achivement(text: mini[index], icon: SvgPicture.asset('assets/icons/subtract.svg')),
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GroupTitle(title: 'Прогресс'),
                        SizedBox(height: 20,),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: full.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(5),
                              child: ProgressCard(
                                  text: full[index][0],
                                  subtext: full[index][1],
                                  percent: 0.6,
                                  icon: SvgPicture.asset('assets/icons/subtract.svg', color: AppTheme().accent, height: 35,)),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}