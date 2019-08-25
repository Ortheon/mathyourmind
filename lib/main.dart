import 'package:flutter/material.dart';

import './Screens/menu_screen.dart';
import './Screens/play_setting_screen.dart';
import './Screens/play_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MathYourMind',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(31, 120, 237, 0.7)
      ),
      initialRoute: MenuScreen.routeName,
      routes: {
        MenuScreen.routeName : (context) => MenuScreen(),
        PlaySettingScreen.routeName : (context) => PlaySettingScreen(),
        PlayScreen.routeName : (context) => PlayScreen(),
      },
    );
  }
}
