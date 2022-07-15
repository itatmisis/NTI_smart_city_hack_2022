import 'package:flutter/material.dart';

class Achivement extends StatelessWidget {
  String text;
  Widget icon;

  Achivement({Key? key,required this.text,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end:  Alignment.bottomCenter,
                colors: [
                  Color(0xFF7E59E7),
                  Color(0xFFD5AAFF)
                ]
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: icon,
              )
            ],
          ),
        )
      ),
    );
  }
  
}