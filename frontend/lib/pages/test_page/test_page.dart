import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/register_page/widgets/radio_widget.dart';
import 'package:frontend/pages/test_page/screens/test_screen.dart';
import 'package:frontend/pages/test_page/test_model.dart';
import 'package:provider/provider.dart';

import '../register_page/widgets/custom_outlined_button.dart';

class TestPage extends StatelessWidget {

  List<Widget> tests = [
    TestScreen(
        title: 'Опрос',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Пройди опрос, чтобы легче определить свои цели и мечты!', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)
          ],
        ),
        alignment: Alignment.topCenter),
    TestScreen(
        title: 'Вопрос 1 / 5',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Прежде чем что-то делать, спроси себя «Зачем?»', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу научиться...',
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
                labelText: 'Я хочу получить...',
              ),
            ),
          ],
        ),
        alignment: Alignment.topLeft),
    TestScreen(
        title: 'Вопрос 2.1 / 5',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioWidget(text: 'Коммуникация и сотрудничество'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Генерация идей'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Организация и организация'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Творчество, создание нового'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Поиск ресурсов')
          ],
        ),
        alignment: Alignment.topLeft, salign: Alignment.topLeft,),
    TestScreen(
        title: 'Вопрос 2.2 / 5',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioWidget(text: 'Достижение и преодоление'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Критическое мышление'),
            SizedBox(height: 20,),
            RadioWidget(text: 'Лидерство, умение вести за собой'),
          ],
        ),
        alignment: Alignment.topLeft, salign: Alignment.topLeft,),
    TestScreen(
      title: 'Вопрос 2.2 / 5',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Приложи свои ассоциации со словом «мечта» в виде фотографий', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          SizedBox(height: 20,),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFDDDDDD),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/icons/camera.svg', height: 40,),
                  )
                ],
              )
            ),
          )
        ],
      ),
      alignment: Alignment.topLeft),
    TestScreen(
        title: 'Вопрос 4 / 5',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Какой я?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomOutlinedButton(text: 'Индивидуал',),
                      CustomOutlinedButton(text: 'Интроверт',),
                      CustomOutlinedButton(text: 'Оптимист',),
                      CustomOutlinedButton(text: 'Серьезный',),
                      CustomOutlinedButton(text: 'Педантичный',),
                      CustomOutlinedButton(text: 'Лидер',),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomOutlinedButton(text: 'Тимплеер',),
                      CustomOutlinedButton(text: 'Экстраверт',),
                      CustomOutlinedButton(text: 'Пессимист',),
                      CustomOutlinedButton(text: 'Беспечный',),
                      CustomOutlinedButton(text: 'Творческий',),
                      CustomOutlinedButton(text: 'Исполнитель',),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        alignment: Alignment.topLeft),
    TestScreen(
        title: 'Вопрос 5 / 5',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('6 вещей, которые я хотел бы сделать, но до сих пор не сделал', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу знать...',
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
                labelText: 'Я хочу знать...',
              ),
            ),

          ],
        ),
        alignment: Alignment.topLeft, salign: Alignment.topCenter,),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 40,
            top: MediaQuery.of(context).padding.top + 20,
            left: 16,
            right: 16
          ),
          child:  Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child:Consumer<TestModel>(
                  builder: (_, model, __) => tests[model.currentPage],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<TestModel>(
                    builder: (_, model, __) =>
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50,
                              child: model.currentPage != 0? TextButton(
                                onPressed: () {
                                  if (model.currentPage == 6) {
                                    Navigator.of(context).pushReplacementNamed('/homePage');
                                  } else {
                                    model.currentPage++;
                                  }
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
                                  child: Text('Пропустить', overflow: TextOverflow.fade,),
                                ),
                              ): SizedBox(),
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (model.currentPage == 6) {
                                    Navigator.of(context).pushReplacementNamed('/homePage');
                                  } else {
                                    model.currentPage++;
                                  }
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
                                  child: model.currentPage != 6? Text('Далее', overflow: TextOverflow.fade,) : Text('Закончить', overflow: TextOverflow.fade,),
                                ),
                              ),
                            )
                          ],
                        )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}