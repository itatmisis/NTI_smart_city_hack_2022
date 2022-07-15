import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  Widget? child;
  ElevatedContainer({this.child, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
        child: ClipRRect(
          child: child,
        ),
        );
  }
}