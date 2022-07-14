import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/screens/achivement_screen.dart';
import 'package:frontend/pages/register_page/register_model.dart';
import 'package:local_hero/local_hero.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


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
                  child: Center(
                      child: AchievementScreen()
                  ),
                )
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child:
                    Container (
                      padding: EdgeInsets.only(top: 9, bottom: 9),
                      child:
                      FloatingActionButton(
                          onPressed: () { },
                          tooltip: 'Increment',
                          child: Icon(Icons.add, size: 23),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                          ),
                      elevation: 0,
                    ),
                    )
                  ),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
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