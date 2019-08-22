import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/elements.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class PlaySettingScreen extends StatefulWidget {

  static const routeName = 'play-settings';

  @override
  _PlaySettingScreenState createState() => _PlaySettingScreenState();
}

class _PlaySettingScreenState extends State<PlaySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: Center(child: SizedBox(child: FadeAnimatedTextKit(
        text: ['PREPARE YOURSELF', 'WILL YOU DARE?', 'BE THE BEST'],
          duration: Duration(seconds: 10),
          textStyle: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold
              ),
        ),),),
              )
            ],),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: <Widget>[
                          AppIconButton(ICONS.PLUS),
                          AppIconButton(ICONS.MINUS),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          AppIconButton(ICONS.MULTIPLY),
                          AppIconButton(ICONS.DIVIDE),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          AppIconButton(ICONS.SQUAREROOT),
                          AppIconButton(ICONS.POWER),
                        ],
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: (){},
                    child: IconButton(icon: Icon(FontAwesomeIcons.play), onPressed: null),
                  ),
                  Column(
                    //do wyjebania
                    children: <Widget>[

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


