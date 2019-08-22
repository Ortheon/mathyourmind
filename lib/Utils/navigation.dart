import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/constants.dart';

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