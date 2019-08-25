import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mathyourmind/Utils/enums.dart';
import 'SharedPrefsHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:grouped_buttons/grouped_buttons.dart';



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

  final EQUATIONS icon;

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
      case EQUATIONS.PLUS: {
        preferences.setBool('add', b);
        break;}
      case EQUATIONS.MINUS: {
        preferences.setBool('subtract', b);
        break;}
      case EQUATIONS.MULTIPLY: {preferences.setBool('multiply', b);
      break;}
      case EQUATIONS.DIVIDE: {preferences.setBool('divide', b);
      break;}
      case EQUATIONS.SQUAREROOT: {preferences.setBool('squareroot', b);
      break;}
      case EQUATIONS.POWER: {preferences.setBool('power', b);
      break;}
    }
  }

  Future<bool> getToggled() async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    //'add', 'subtract', 'multiply', 'divide', 'squareroot', 'power'
    switch(widget.icon) {
      case EQUATIONS.PLUS: {return preferences.getBool('add') ?? false;}
      case EQUATIONS.MINUS: {return preferences.getBool('subtract') ?? false;}
      case EQUATIONS.MULTIPLY: {return preferences.getBool('multiply') ?? false;}
      case EQUATIONS.DIVIDE: {return preferences.getBool('divide') ?? false;}
      case EQUATIONS.SQUAREROOT: {return preferences.getBool('squareroot') ?? false;}
      case EQUATIONS.POWER: {return preferences.getBool('power') ?? false;}
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

IconData getProperIcon(EQUATIONS icon) {
  IconData iconData;
  switch(icon) {
    case EQUATIONS.PLUS: {iconData = FontAwesomeIcons.plus; return iconData;}
    case EQUATIONS.MINUS: {iconData = FontAwesomeIcons.minus; return iconData;}
    case EQUATIONS.MULTIPLY: {iconData = FontAwesomeIcons.times; return iconData;}
    case EQUATIONS.DIVIDE: {iconData = FontAwesomeIcons.divide; return iconData;}
    case EQUATIONS.SQUAREROOT: {iconData = FontAwesomeIcons.squareRootAlt; return iconData;}
    case EQUATIONS.POWER: {iconData = FontAwesomeIcons.superscript; return iconData;}
  }
}
/////////
enum DIFFICULTY {
  EASY, MEDIUM, HARD
}



class DifficultyRadio extends StatefulWidget {



  @override
  _DifficultyRadioState createState() => _DifficultyRadioState();
}

class _DifficultyRadioState extends State<DifficultyRadio> {
  //TODO Rozjezdza sie cholerstwo
  List<String> difficulties = ['EASY', 'MIDD', 'HARD'];

  void setSelectedDifficulty(String selected) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('DIFFICULTY', selected);
  }
  Future<String> getSelectedDifficulty() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('DIFFICULTY');
  }

  void changeSelected(sel){
    _selected = sel;
    setSelectedDifficulty(_selected);
    setState(() {});
  }

  var _selected;
  @override
  void initState() {
    getSelectedDifficulty().then((result) => {
      _selected = result,
        setState(() {
    })
    });

  }

  @override
  Widget build(BuildContext context) {
    if(_selected == null) _selected = 'MIDD';
    return Column(
      children: <Widget>[
        RadioButtonGroup(
            labels: difficulties,
        activeColor: Colors.lightGreenAccent,
        onSelected: changeSelected,
            labelStyle: TextStyle(letterSpacing: 2,),
          picked: _selected,
        ),
      ],
    );
  }
}

Future<List<int>> getPossibleEquation() async {
  List<int> eq = new List();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  if(preferences.getBool('add' ?? false) == true) eq.add(EQUATIONS.PLUS.index);
  if(preferences.getBool('subtract' ?? false) == true) eq.add(EQUATIONS.MINUS.index);
  if(preferences.getBool('multiply' ?? false) == true) eq.add(EQUATIONS.MULTIPLY.index);
  if(preferences.getBool('divide' ?? false) == true) eq.add(EQUATIONS.DIVIDE.index);
  if(preferences.getBool('squareroot' ?? false) == true) eq.add(EQUATIONS.SQUAREROOT.index);
  if(preferences.getBool('power' ?? false) == true) eq.add(EQUATIONS.POWER.index);
  return eq;
}
Future<int> getGameTime() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String difficulty = preferences.getString('DIFFICULTY');
  switch(difficulty) {
    case 'EASY' : {return 60;}
    case 'MIDD' : {return 45;}
    case 'HARD' : {return 30;}
    default: return 45;
  }
}