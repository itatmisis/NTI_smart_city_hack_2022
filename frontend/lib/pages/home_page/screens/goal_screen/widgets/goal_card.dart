import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/screens/dream_screen/dream.dart';
import 'package:provider/provider.dart';

import '../goal.dart';

class GoalCard extends StatefulWidget {
  Goal goal;
  GoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AspectRatio(
          aspectRatio: 3/4,
          child: Container(
              key: ValueKey<int>(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 7,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),

              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Center(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(widget.goal.image, fit: BoxFit.cover,),
                                )
                              )
                          )
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        flex: 6,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.goal.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22), overflow: TextOverflow.fade,),
                                    SizedBox(height: 5,),
                                    Text(widget.goal.date, style: TextStyle(fontSize: 16, color: Color(0xFF425466), overflow: TextOverflow.fade)),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      height: 30,
                                      child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: widget.goal.hashtags.length,
                                          itemBuilder: (_, index) => Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Chip(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                              label: Text(widget.goal.hashtags[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                              backgroundColor: AppTheme().accent,
                                            ),
                                          )
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(widget.goal.body, style: TextStyle(fontSize: 16, color: Color(0xFF425466), overflow: TextOverflow.fade), maxLines: 3,),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('84%'),
                                          Text('100%')
                                        ],
                                      ),
                                      LinearProgressIndicator(
                                        value: 0.84,
                                      ),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                    ],
                  )
              )
          )
      ),
    );
  }
}