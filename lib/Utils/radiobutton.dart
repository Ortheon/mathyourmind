import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionNumberRadioButton extends StatefulWidget {
  @override
  _QuestionNumberRadioButtonState createState() => _QuestionNumberRadioButtonState();
}

class _QuestionNumberRadioButtonState extends State<QuestionNumberRadioButton> {

  List<String> questionNumberPossibilities = ['10', '15', '20'];
  var _selected;

  void changeSelected(sel){
    _selected = sel;
    setSelectedPossibility(_selected);
    setState(() {});
  }


  @override
  void initState() {
    getSelectedPossibility().then((result) => {
      setState(() {_selected = result;})
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_selected == null) _selected = '10';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RadioButtonGroup(
          labels: questionNumberPossibilities,
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          activeColor: Colors.lightGreenAccent,
          onSelected: changeSelected,
          labelStyle: TextStyle(letterSpacing: 2,),
          picked: _selected,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          itemBuilder: (Radio rb, Text txt, int i){
            return Row(
              children: <Widget>[
                rb,
                txt,
              ],
            );
          },
        ),
      ],
    );
  }
}


void setSelectedPossibility(String selected) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('questionNumber', selected);
}
Future<String> getSelectedPossibility() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('questionNumber');
}