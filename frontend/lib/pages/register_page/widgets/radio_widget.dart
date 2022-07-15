import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {

  String text;

  RadioWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

enum SingingCharacter { q, w, r, e, t, y }



class _RadioWidgetState extends State<RadioWidget> {

  SingingCharacter? _character = SingingCharacter.q;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 1,
                title: const Text('1'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.q,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 1,
                title: const Text('2'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.w,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 1,
                title: const Text('3'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.e,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 1,
                title: const Text('4'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.r,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 1,
                title: const Text('5'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.t,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}