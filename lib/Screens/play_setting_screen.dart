import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/elements.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Screens/play_screen.dart';
import '../Utils/enums.dart';

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
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: SizedBox(
                      child: FadeAnimatedTextKit(
                        text: ['SET DIFFCULTY', 'SET EQUATIONS', 'PLAY'],
                        duration: Duration(seconds: 10),
                        textStyle: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                        alignment: Alignment(0, 0),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
                          AppIconButton(EQUATIONS.PLUS),
                          AppIconButton(EQUATIONS.MINUS),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          AppIconButton(EQUATIONS.MULTIPLY),
                          AppIconButton(EQUATIONS.DIVIDE),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          AppIconButton(EQUATIONS.SQUAREROOT),
                          AppIconButton(EQUATIONS.POWER),
                        ],
                      ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.play),
                        onPressed: () {
                          Navigator.pushNamed(context, PlayScreen.routeName);
                        }),
                  ),
                  Wrap(
                    //do wyjebania
                    children: <Widget>[
                      DifficultyRadio(),
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
