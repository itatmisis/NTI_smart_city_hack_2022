import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/widgets/search.dart';
import 'package:provider/provider.dart';


class GoalMain extends StatefulWidget {

  const GoalMain({Key? key}) : super(key: key);

  @override
  State<GoalMain> createState() => _GoalMainState();
}

class _GoalMainState extends State<GoalMain> {

  int taskCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top+20,
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20),
                  child: Text('Поступить в вуз', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26)),
                )
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/goal_screen.png')
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}