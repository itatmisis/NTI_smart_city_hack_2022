import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';

class GroupTitle extends StatelessWidget {
  String title;
  GroupTitle({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
        Text('Показать всё', style: TextStyle(color: AppTheme().accent, fontSize: 18),)
      ],
    );
  }

}