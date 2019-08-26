import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function function;


  AnswerButton(this.color, this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(onPressed: function,
          color: color,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topLeft: Radius.circular(25)), side: BorderSide(width: 1)),
          //shape: Border.fromBorderSide(BorderSide(style: BorderStyle.solid)),
          child: Text(text,
              style: TextStyle(fontSize: 32),
          softWrap: true,),
        ),
      ),
    );
  }
}
