import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SharedPrefsHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RoundedButton extends StatelessWidget {

  final String text;
  final Function function;


  RoundedButton(this.text, this.function);

  @override
  Widget build(BuildContext context) {
     return RaisedButton(
      textColor: Colors.white,
      color: Theme.of(context).canvasColor,
      child: Text(text, style: kAppButtonTextStyle,),
      onPressed: function,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),);
  }
}

class AppIconButton extends StatefulWidget {

  final ICONS icon;

  AppIconButton(this.icon);

  @override
  _AppIconButtonState createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {


  var _toggled;

  void changeStateOfAButton() {
    setState(() {

      this._toggled = !this._toggled;
      setToggled(_toggled);


    });
  }

  void setToggled(bool b) async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    //'add', 'subtract', 'multiply', 'divide', 'squareroot', 'power'
    switch(widget.icon) {
      case ICONS.PLUS: {
        preferences.setBool('add', b);
        break;}
      case ICONS.MINUS: {
        preferences.setBool('subtract', b);
        break;}
      case ICONS.MULTIPLY: {preferences.setBool('multiply', b);
      break;}
      case ICONS.DIVIDE: {preferences.setBool('divide', b);
      break;}
      case ICONS.SQUAREROOT: {preferences.setBool('squareroot', b);
      break;}
      case ICONS.POWER: {preferences.setBool('power', b);
      break;}
    }
  }

  Future<bool> getToggled() async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    //'add', 'subtract', 'multiply', 'divide', 'squareroot', 'power'
    switch(widget.icon) {
      case ICONS.PLUS: {return preferences.getBool('add') ?? false;}
      case ICONS.MINUS: {return preferences.getBool('subtract') ?? false;}
      case ICONS.MULTIPLY: {return preferences.getBool('multiply') ?? false;}
      case ICONS.DIVIDE: {return preferences.getBool('divide') ?? false;}
      case ICONS.SQUAREROOT: {return preferences.getBool('squareroot') ?? false;}
      case ICONS.POWER: {return preferences.getBool('power') ?? false;}
    }
  }


  @override
  Widget build(BuildContext context) {
    if(_toggled == null) _toggled = false;

    return FlatButton(
      onPressed: () {
        changeStateOfAButton();
      },
      child: Icon(getProperIcon(widget.icon),
      color: _toggled ? Colors.green: Colors.black54,),
      //color: toggled? Colors.lightGreen : Colors.black54,
    );
  }

  @override
  void initState() {
   getToggled().then((result) {
     _toggled = result;
     setState(() {
       
     });
   });
  }
}

enum ICONS {
  PLUS, MINUS, MULTIPLY, DIVIDE, SQUAREROOT, POWER
}
IconData getProperIcon(ICONS icon) {
  IconData iconData;
  switch(icon) {
    case ICONS.PLUS: {iconData = FontAwesomeIcons.plus; return iconData;}
    case ICONS.MINUS: {iconData = FontAwesomeIcons.minus; return iconData;}
    case ICONS.MULTIPLY: {iconData = FontAwesomeIcons.times; return iconData;}
    case ICONS.DIVIDE: {iconData = FontAwesomeIcons.divide; return iconData;}
    case ICONS.SQUAREROOT: {iconData = FontAwesomeIcons.squareRootAlt; return iconData;}
    case ICONS.POWER: {iconData = FontAwesomeIcons.superscript; return iconData;}
  }
}
