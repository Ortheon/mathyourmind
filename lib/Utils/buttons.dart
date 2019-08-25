import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function funtion;


  AnswerButton(this.color, this.text, this.funtion);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(onPressed: funtion,
        color: color,
        shape: UnderlineInputBorder(borderSide: BorderSide(width:20)),
        child: Text(text,
            style: TextStyle(fontSize: 32),
        softWrap: true,),
      ),
    );
  }
}
