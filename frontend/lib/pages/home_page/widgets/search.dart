import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
            child: Image.asset('assets/images/ilya.png'),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme().light_search_bar_field_background,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/search.svg'),
                    SizedBox(width: 10,),
                    Text('Поиск', style: TextStyle(color: AppTheme().light_search_bar_text_hint))
                  ],
                ),
              )
            )
          ),
        )
      ],
    );
  }

}