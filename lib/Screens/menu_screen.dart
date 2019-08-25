import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/elements.dart';

import 'play_setting_screen.dart';
import 'play_screen.dart';

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
                fontSize: 32,)
                ,
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/icon-pi.png', height: MediaQuery.of(context).size.height*0.3, width: MediaQuery.of(context).size.width*0.3, color: Colors.amber,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 90,
                        foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(55)),
                        color: Colors.blueGrey.withOpacity(0.01)),
                        child: IconButton(
                            icon: Icon(FontAwesomeIcons.play),
                            onPressed: (){Navigator.pushNamed(context, PlayScreen.routeName);},
                          iconSize: MediaQuery.of(context).size.height*0.1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(55)),
                        color: Colors.blueGrey.withOpacity(0.01)),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.cog),
                      onPressed: (){Navigator.pushNamed(context, PlaySettingScreen.routeName);},
                      iconSize: MediaQuery.of(context).size.height*0.05,
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(55)),
                        color: Colors.blueGrey.withOpacity(0.01)),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.list),
                      onPressed: (){},
                      iconSize: MediaQuery.of(context).size.height*0.05,
                    ),
                  ),
                ],
            ),
                  //RoundedButton('PLAY', (){Navigator.pushNamed(context, PlaySettingScreen.routeName);}),
                  //RoundedButton('STATISTICS', (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
