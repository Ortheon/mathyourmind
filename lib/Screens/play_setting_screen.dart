import 'package:flutter/material.dart';
import '../Utils/elements.dart';
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
                      //width: MediaQuery.of(context).size.width*0.1,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Text('SETTINGS',
                      style: TextStyle(fontSize: 32),),

                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,

            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Equation signs',
                          style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
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

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,

            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Play time',
                      style: TextStyle(fontSize: 20),),
                    DifficultyRadio(),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
