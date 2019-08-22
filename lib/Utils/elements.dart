import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  var _toggled = false;
  void changeStateOfAButton() {
    setState(() {
      this._toggled = !this._toggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        changeStateOfAButton();
      },
      child: Icon(getProperIcon(widget.icon),
      color: _toggled ? Colors.green: Colors.black54,),
      //color: toggled? Colors.lightGreen : Colors.black54,
    );
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
    case ICONS.SQUAREROOT: {iconData = FontAwesomeIcons.superscript; return iconData;}
    case ICONS.POWER: {iconData = FontAwesomeIcons.superscript; return iconData;}
  }
}
