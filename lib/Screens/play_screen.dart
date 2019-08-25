import 'package:flutter/material.dart';
import 'package:mathyourmind/Utils/buttons.dart';
import '../models/equation.dart';
import '../Utils/elements.dart';
import '../Utils/enums.dart';
import 'dart:async';
import 'dart:math';

class PlayScreen extends StatefulWidget {

  static const String routeName = 'play-screen';

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  Equation equation;
  bool isStarted = false;

  Timer _timer;
  Timer _gameTimer;
  int _start = 3;

  int _timeLeft = 30;

  int lives = 3;
  int questionNumber = 1;
  int points = 0;
  List<double> answers = new List();

  void answerQuestion(var answer) {

    if(equation.answer == answer) {
      points++;
      print('points' + points.toString());
    }
    else {
      lives--;
      if(lives<1) {
        //TODO ALERT, PO KLIKNIECIU WYPIERDALA NA EKRAN POCZATKOWY
      }
    }

    getPossibleEquation().then(
            (result) =>  {
              result.shuffle(),
              equation = Equation(sign: EQUATIONS.values[result.last]),
            generateAnswer(),
            questionNumber++,
            });


    setState(() {
    });

  }

  void generateAnswer() {
    answers.clear();
    var answer = equation.answer;
    //todo na mapach
    bool doubleOrInt = ((equation.sign == EQUATIONS.PLUS) || (equation.sign == EQUATIONS.MINUS) || (equation.sign == EQUATIONS.MULTIPLY)| (equation.sign == EQUATIONS.POWER));
    int parse = 2;
    if (doubleOrInt) parse = 0;
    var falseAnswer1 = double.parse((Random().nextDouble()*answer*(Random().nextDouble()+Random().nextDouble())).toStringAsFixed(parse));
    var falseAnswer2 = double.parse((Random().nextDouble()*answer*(Random().nextDouble()+Random().nextDouble())).toStringAsFixed(parse));
    var falseAnswer3 = double.parse((Random().nextDouble()*answer*(Random().nextDouble()+Random().nextDouble())).toStringAsFixed(parse));

    if (doubleOrInt) {
      answer.floor();
      falseAnswer1.ceilToDouble();
      falseAnswer2.floorToDouble();
      falseAnswer3.ceilToDouble();}
    answers.add(answer);
    answers.add(falseAnswer1);
    answers.add(falseAnswer2);
    answers.add(falseAnswer3);
    answers.shuffle();
    setState(() {
    });

    print('answer: ' + answer.toString());

  }


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            isStarted = true;
            generateAnswer();
            startGameTimer();
          } else {
            _start = _start - 1;
            print('Start time: ' + _start.toString());
            setState(() {

            });
          }
        },
      ),
    );
  }

  void startGameTimer() {
    const oneSec = const Duration(seconds: 1);
    _gameTimer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_timeLeft < 1) {
            timer.cancel();
          } else {
            _timeLeft = _timeLeft - 1;
            //print('Left time: ' + _timeLeft.toString());
            setState(() {

            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _gameTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    getGameTime().then((time) => _timeLeft = time);
    getPossibleEquation().then(
            (result) =>  {
              result.shuffle(),
            equation = Equation(sign: EQUATIONS.values[result.last]),

        result.forEach(
                    (element) => debugPrint(element.toString()))});
    setState(() {
    });


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
                child: DecoratedBox(child: Center(child: isStarted ? Text(_timeLeft.toString()): Text('TIME')),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.lightGreenAccent, Colors.lightGreen]),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(45), bottomRight: Radius.circular(45)),
                  border: Border.all(style: BorderStyle.solid, width: 1, ),
                ),),
              ),

              SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(child: Center(child: !_timer.isActive ? Text(questionNumber.toString()) : Text((3-_timer.tick).toString())),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.yellow, Colors.yellowAccent]),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    border: Border.all(style: BorderStyle.solid, width: 1, ),
                  ),),
              ),

              SizedBox(
                height: 100,
                width: 120,
                child: DecoratedBox(child: Center(child: Text('POINTS')),
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
                    Center(child: isStarted ? Icon(getProperIcon(equation.sign)) : Icon(Icons.details)),
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
                  AnswerButton(Colors.lightGreen, isStarted ? answers[0].toString() : 'A',  (){if(isStarted) answerQuestion(answers[0]);}),
                  AnswerButton(Colors.lightBlue, isStarted ? answers[1].toString(): 'B', (){if(isStarted) answerQuestion(answers[1]);}),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnswerButton(Colors.yellowAccent, isStarted ? answers[2].toString() : 'C', (){if(isStarted) answerQuestion(answers[2]);}),
                  AnswerButton(Colors.pinkAccent, isStarted ? answers[3].toString(): 'D', (){if(isStarted) answerQuestion(answers[3]);}),
              ],),
            ],
          )
        ],

      ),
      ),
    );
  }
}

