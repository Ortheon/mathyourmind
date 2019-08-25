import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function function;


  AnswerButton(this.color, this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(onPressed: function,
        color: color,
        shape: Border.fromBorderSide(BorderSide(style: BorderStyle.solid)),
        child: Text(text,
            style: TextStyle(fontSize: 32),
        softWrap: true,),
      ),
    );
  }
}
