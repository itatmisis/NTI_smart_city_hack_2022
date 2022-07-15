import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:provider/provider.dart';

class CreateScreenDream extends StatefulWidget {
  @override
  State<CreateScreenDream> createState() => _CreateScreenDreamState();
}

enum SingingCharacter { q, w, r, e, t, y }

class _CreateScreenDreamState extends State<CreateScreenDream> {

  SingingCharacter? _character = SingingCharacter.q;
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
                  child: Text('Появление мечты', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26)),
                )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('Напишите название мечты', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                    Text('Дата появления мечты', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                    Text('Пояснения к мечте', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                        labelText: 'Поянение...',
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('Теги мечты', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                    SizedBox(height: 20,),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 1,
                      title: const Text('Учёба'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.w,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 1,
                      title: const Text('Работа'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.e,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 1,
                      title: const Text('Музыка'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.r,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 1,
                      title: const Text('Спорт'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.t,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Consumer<HomeModel>(
                        builder: (_, model, __) => SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              model.currentIndex = 1;
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