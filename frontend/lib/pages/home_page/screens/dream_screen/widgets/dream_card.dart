import 'package:flutter/material.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/pages/home_page/home_model.dart';
import 'package:frontend/pages/home_page/screens/dream_screen/dream.dart';
import 'package:provider/provider.dart';

class DreamCard extends StatefulWidget {
  Dream dream;
  DreamCard({Key? key, required this.dream}) : super(key: key);

  @override
  State<DreamCard> createState() => _DreamCardState();
}

class _DreamCardState extends State<DreamCard> {

  bool value = false;


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2/1,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 100),
        child: value?
        Container(
            key: ValueKey<int>(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              color: AppTheme().accent
            ),

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Checkbox(
                          value: value,
                          onChanged: (bool? value) {},
                        activeColor: Colors.white,
                        checkColor: AppTheme().accent,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.dream.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22), overflow: TextOverflow.fade),
                          SizedBox(height: 5,),
                          Text(widget.dream.date, style: TextStyle(color: Colors.white, fontSize: 16), overflow: TextOverflow.fade),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: widget.dream.hashtags.length,
                                itemBuilder: (_, index) => Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Chip(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    label: Text(widget.dream.hashtags[index], style: TextStyle(color: AppTheme().accent, fontWeight: FontWeight.w600),),
                                    backgroundColor: Colors.white,
                                  ),
                                )
                            ),
                          )
                        ],
                      )
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(widget.dream.body, style: TextStyle(color: Colors.white, fontSize: 16), overflow: TextOverflow.fade),
                  )
                ],
              ),
            )
        ) :
        Container(
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
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Consumer<HomeModel>(
                        builder: (_, model, __) => Checkbox(
                          value: value,
                          onChanged: (bool? value) => setState(() {
                            this.value = !this.value;
                            Future.delayed(Duration(milliseconds: 300)).then((value) => model.currentIndex = 4);
                          }),
                        ),
                      )
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.dream.title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22), overflow: TextOverflow.fade,),
                          SizedBox(height: 5,),
                          Text(widget.dream.date, style: TextStyle(fontSize: 16, color: Color(0xFF425466), overflow: TextOverflow.fade)),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: widget.dream.hashtags.length,
                                itemBuilder: (_, index) => Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Chip(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    label: Text(widget.dream.hashtags[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
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
                    child: Text(widget.dream.body, style: TextStyle(fontSize: 16, color: Color(0xFF425466), overflow: TextOverflow.ellipsis), maxLines: 2,),
                  )
                ],
              ),
            )
        )
      )
    );
  }
}