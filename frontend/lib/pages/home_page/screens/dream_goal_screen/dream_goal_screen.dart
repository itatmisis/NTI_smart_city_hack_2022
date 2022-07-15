import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';
import 'package:provider/provider.dart';


class DreamGoalScreen extends StatefulWidget {

  const DreamGoalScreen({Key? key}) : super(key: key);

  @override
  State<DreamGoalScreen> createState() => _DreamGoalScreenState();
}

class _DreamGoalScreenState extends State<DreamGoalScreen> {

  int taskCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top+20,
          left: 20,
          right: 20
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Из мечты в цель', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26)),
              )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('Желаемая дата достижения', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                        labelText: 'Дата...',
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Пояснения к цели', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                        labelText: 'Название...',
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Добавьте фото', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                    SizedBox(height: 20,),
                    AspectRatio(
                      aspectRatio: 3/2,
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppTheme().light_field_border,
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
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Задачи', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                        ElevatedButton(onPressed: () => setState(() => taskCount++), child: Text('Добавить'))
                      ],
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: taskCount,
                      itemBuilder: (_, index) =>  Column(
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
                              labelText: 'Задача ${index+1}...',
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      )
                    ),
                    SizedBox(height: 30,),
                    Consumer<HomeModel>(
                      builder: (_, model, __) => SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            model.currentIndex = 2;
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
                            child: Text('Создать', overflow: TextOverflow.fade,),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}