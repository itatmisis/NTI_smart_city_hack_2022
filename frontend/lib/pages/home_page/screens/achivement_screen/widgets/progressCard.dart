import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  String text, subtext;
  Widget icon;
  double percent;

  ProgressCard({Key? key,
    required this.text, required this.subtext,
    required this.icon, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 7,
            blurStyle: BlurStyle.outer,
          ),
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Expanded(
            child: icon,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  Text(subtext, style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  LinearProgressIndicator(
                    value: percent,
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}