import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen/achivement_screen.dart';
import 'package:frontend/pages/home_page/screens/create_dream_screen/create_dream_screen.dart';
import 'package:frontend/pages/home_page/screens/dream_goal_screen/dream_goal_screen.dart';
import 'package:frontend/pages/home_page/screens/dream_screen/dream_screen.dart';
import 'package:frontend/pages/home_page/screens/goal_main/goal_main.dart';
import 'package:frontend/pages/home_page/screens/goal_screen/goal_screen.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

import 'screens/v_screen/v_screen.dart';

class HomePage extends StatelessWidget {

  List<Widget> screens = [
    AchivementScreen(),
    DreamScreen(),
    GoalScreen(),
    VScreen(),
    DreamGoalScreen(),
    CreateScreenDream(),
    GoalMain()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeModel()),
      ],
      child: Consumer<HomeModel>(
        builder: (_, model, __) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: LocalHeroScope(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeIn,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: screens[model.currentIndex]
                )
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/a1.svg', color: model.currentIndex == 0? AppTheme().accent : Color(0xFF99A2AD),),
                          onPressed: () {
                            model.currentIndex = 0;
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/a2.svg', color: model.currentIndex == 1? AppTheme().accent : Color(0xFF99A2AD),),
                          onPressed: () {
                            model.currentIndex = 1;
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding (
                      padding: EdgeInsets.only(top: 8, bottom:8, left:12, right:12),
                      child: FloatingActionButton(
                          onPressed: () { model.currentIndex = 5;},
                          tooltip: 'Increment',
                          child: Icon(Icons.add),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                          ),
                      elevation: 0,
                    ),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/a3.svg', color: model.currentIndex == 2? AppTheme().accent : Color(0xFF99A2AD),),
                          onPressed: () {
                            model.currentIndex = 2;
                          },
                        ),
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/a4.svg', color: model.currentIndex == 3? AppTheme().accent : Color(0xFF99A2AD),),
                          onPressed: () {
                            model.currentIndex = 3;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              color: AppTheme().light_background_light,
            ),
          );
        }
      )
    );
  }

}