import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/widgets/elevated_container/elevated_container.dart';

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 7,
              blurStyle: BlurStyle.outer,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end:  Alignment.bottomRight,
              colors: [
                Color(0xFF5030E5),
                Color(0xFF8C79E7)
              ]
          ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Создайте цель', style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600)),
                    Text('Начни свой путь покорения мечты', style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)))
                  ],
                ),
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppTheme().custom_banner_white_button)),
                child: Text('Погнали', style: TextStyle(color: Colors.black),),
              )
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset('assets/icons/goal.svg'),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset('assets/icons/cross.svg'),
            )
          ],
        ),
      )
    );
  }

}