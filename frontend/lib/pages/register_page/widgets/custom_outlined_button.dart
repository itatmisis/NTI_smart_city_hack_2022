import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';

class CustomOutlinedButton extends StatefulWidget {
  String text;
  CustomOutlinedButton({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
          onPressed: () {
            setState(() => isActive = !isActive);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(isActive? AppTheme().accent : Colors.white)
          ),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(widget.text, style: TextStyle(color: !isActive? AppTheme().accent : Colors.white),),
            )
          )
      ),
    );
  }
}