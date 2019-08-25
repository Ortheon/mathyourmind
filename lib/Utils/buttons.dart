import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function funtion;


  AnswerButton(this.color, this.text, this.funtion);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: funtion,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Text(text),
    );
  }
}
