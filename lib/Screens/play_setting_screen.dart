import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/elements.dart';


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
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: Center(child: Text('settings'))),

            ],),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
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
                    child: Text('PLAY'),
                  ),
                  Column(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


