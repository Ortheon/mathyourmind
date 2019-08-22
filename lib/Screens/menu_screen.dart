import 'package:flutter/material.dart';
import '../Utils/elements.dart';

import 'play_setting_screen.dart';

class MenuScreen extends StatelessWidget {

  static const routeName = 'menu-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                'MathYourMind!',
                style: TextStyle(
                    fontFamily: 'RockSalt',
                fontSize: 40,)
                ,
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/icon-pi.png', height: 200, width: 200, color: Colors.amber,),
                  RoundedButton('PLAY', (){Navigator.pushNamed(context, PlaySettingScreen.routeName);}),
                  RoundedButton('STATISTICS', (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
