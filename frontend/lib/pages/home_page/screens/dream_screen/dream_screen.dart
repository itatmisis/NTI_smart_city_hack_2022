import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen/widgets/achivement.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen/widgets/progressCard.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';

import 'dream.dart';
import 'widgets/dream_card.dart';

class DreamScreen extends StatefulWidget {

  const DreamScreen({Key? key}) : super(key: key);

  @override
  State<DreamScreen> createState() => _DreamScreenState();
}

class _DreamScreenState extends State<DreamScreen> {

  List<Dream> dream = [
    Dream('Поступить в вуз', 'Сдать ЕГЭ на высокий балл, выбрать технический вуз, выбрать IT направление в нем и сдать внутренние экзамены, где необходимо.', '21 июня', ['Образование']),
    Dream('Купить Nissan Silvia S13', 'Как же было бы круто ее водить...', '4 мая', ['Развлечения']),
    Dream('Стать влиятельным', 'Если бы ко мне прислушивались толпы людей, я бы предотвратил много войн и конфликтов, скооперировал людей для создания чего - то полезного', '3 февраля', ['Будущее']),
  ];

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Мечты', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),),
                    ),
                    SizedBox(height: 10,),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: dream.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          child: DreamCard(dream: dream[index]),
                        )
                    )
                  ],
                ),
              )
            )

          ],
        )
    );
  }
}