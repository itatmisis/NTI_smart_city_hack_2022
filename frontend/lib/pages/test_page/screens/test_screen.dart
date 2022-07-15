import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  String title;
  Widget child;
  Alignment alignment, salign;
  TestScreen({Key? key, required this.title, required this.child, required this.alignment, Alignment? salign}) :
        salign = salign??Alignment.center, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: alignment,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),),
          ),
          SizedBox(height: 40,),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: salign,
                  child: child,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}