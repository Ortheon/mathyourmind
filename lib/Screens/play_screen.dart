import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/buttons.dart';
import '../models/equation.dart';
import '../Utils/elements.dart';
import '../Utils/enums.dart';

class PlayScreen extends StatefulWidget {

  static const String routeName = 'play-screen';

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  Equation equation;

  bool isStarted = false;


  @override
  void initState() {
    getPossibleEquation().then(
            (result) =>  {result.shuffle(), equation = Equation(sign: EQUATIONS.values[result.last]) ,result.forEach(
                    (element) => debugPrint(element.toString()))});
    setState(() {
    });
    isStarted = true;

  }

  @override
  Widget build(BuildContext context) {
    if(equation == null) equation = Equation(sign: EQUATIONS.MINUS);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 120,
                child: DecoratedBox(child: Center(child: Text('CZAS')),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.lightGreenAccent, Colors.lightGreen]),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
                  border: Border.all(style: BorderStyle.solid, width: 1, ),
                ),),
              ),

              SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(child: Center(child: Text('PYTANIE')),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.yellow, Colors.yellowAccent]),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    border: Border.all(style: BorderStyle.solid, width: 1, ),
                  ),),
              ),

              SizedBox(
                height: 100,
                width: 120,
                child: DecoratedBox(child: Center(child: Text('PKT')),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), bottomLeft: Radius.circular(45)),
                    border: Border.all(style: BorderStyle.solid, width: 1, ),
                  ),),
              ),
            ],
          ),
          //question
          //answers
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                width: 0,
              ),
              SizedBox(
                height: 70,
                width: 120,
                child: DecoratedBox(child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(child: isStarted ? Text(equation.a.toString()) : Text('...')),
                    Center(child: isStarted ? Icon(getProperIcon(equation.sign)) : Icons.details),
                    Center(child: isStarted ? Text(equation.b.toString()) : Text('...')),
                  ],
                ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(style: BorderStyle.solid, width: 1, ),
                  ),),
              ),
            ],
          ),
          Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnswerButton(Colors.lightGreen, 'A', (){setState(() {getPossibleEquation().then(
                          (result) =>  {result.shuffle(), equation = Equation(sign: EQUATIONS.values[result.last]) ,result.forEach(
                              (element) => debugPrint(element.toString()))});});}),
                  AnswerButton(Colors.lightBlue, 'B', (){getPossibleEquation().then(
                          (result) =>  {result.shuffle(), equation = Equation(sign: EQUATIONS.values[result.last]) ,result.forEach(
                              (element) => debugPrint(element.toString()))});
                  setState(() {});}),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnswerButton(Colors.yellowAccent, 'C', (){getPossibleEquation().then(
                          (result) =>  {result.shuffle(), equation = Equation(sign: EQUATIONS.values[result.last]) ,result.forEach(
                              (element) => debugPrint(element.toString()))});
                  setState(() {

                  });}),
                  AnswerButton(Colors.pinkAccent, 'D', (){getPossibleEquation().then(
                          (result) =>  {result.shuffle(), equation = Equation(sign: EQUATIONS.values[result.last]) ,result.forEach(
                              (element) => debugPrint(element.toString()))});
                  setState(() {
                    print(equation.sign.toString());

                  });}),
              ],),
            ],
          )
        ],

      ),
      ),
    );
  }
}

