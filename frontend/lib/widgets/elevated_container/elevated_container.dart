import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 7), // Shadow position
              ),
            ],
          ),
        );
  }
}