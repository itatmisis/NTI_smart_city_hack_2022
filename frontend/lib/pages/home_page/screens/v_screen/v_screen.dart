import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';
import 'package:provider/provider.dart';


class VScreen extends StatefulWidget {

  const VScreen({Key? key}) : super(key: key);

  @override
  State<VScreen> createState() => _VScreenState();
}

class _VScreenState extends State<VScreen> {

  int taskCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: 45,
                child: Search(),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/last_screen.png')
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}