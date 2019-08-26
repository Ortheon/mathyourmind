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
    if (equation.answer == answer) {
      points++;
      print('points' + points.toString());
    } else {
      lives--;
      if (lives < 1) {
        //TODO ALERT, PO KLIKNIECIU WYPIERDALA NA EKRAN POCZATKOWY
      }
    }

    getPossibleEquation().then((result) => {
          result.shuffle(),
          equation = Equation(sign: EQUATIONS.values[result.last]),
          generateAnswer(),
          questionNumber++,
        });

    setState(() {});
  }

  void generateAnswer() {
    answers.clear();
    var answer = equation.answer;
    //todo na mapach
    bool doubleOrInt = ((equation.sign == EQUATIONS.PLUS) ||
        (equation.sign == EQUATIONS.MINUS) ||
        (equation.sign == EQUATIONS.MULTIPLY) |
            (equation.sign == EQUATIONS.POWER));
    int parse = 2;

    bool isNotUnique(double a, double b, double c, double d) {
      if (a != b && a != c && a != d) {
        if (b != c && b != d) {
          if (c != d) return false;
        }
      }
      return true;
    }

    var falseAnswer1;
    var falseAnswer2;
    var falseAnswer3;

    if (doubleOrInt) parse = 0;
    do {
      falseAnswer1 = double.parse((Random().nextDouble() *
              answer *
              (Random().nextDouble() +
                  Random().nextDouble() +
                  Random().nextDouble()))
          .toStringAsFixed(parse));
      falseAnswer2 = double.parse((Random().nextDouble() *
              answer *
              (Random().nextDouble() + Random().nextDouble()))
          .toStringAsFixed(parse));
      falseAnswer3 = double.parse((Random().nextDouble() *
              answer *
              (Random().nextDouble() + Random().nextDouble()))
          .toStringAsFixed(parse));


      answer = double.parse(answer.toStringAsFixed(parse));

        print('gen answer: ' + answer.toString());
        print('gen answer1: ' + falseAnswer1.toString());
        print('gen answer2: ' + falseAnswer2.toString());
        print('gen answer3: ' + falseAnswer3.toString());

    } while (isNotUnique(answer, falseAnswer1, falseAnswer2, falseAnswer3));

    answers.add(answer);
    answers.add(falseAnswer1);
    answers.add(falseAnswer2);
    answers.add(falseAnswer3);
    answers.shuffle();
    setState(() {});

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
            setState(() {});
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
            setState(() {});
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
    getPossibleEquation().then((result) => {
          result.shuffle(),
          equation = Equation(sign: EQUATIONS.values[result.first]),
          result.forEach((element) => debugPrint(element.toString()))
        });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (equation == null) equation = Equation(sign: EQUATIONS.MINUS);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 120,
                  child: DecoratedBox(
                    child: Center(
                        child: isStarted
                            ? Text(_timeLeft.toString(),
                                style: TextStyle(fontSize: 32))
                            : Text('TIME')),
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                        Colors.blueGrey.withOpacity(0.9),
                        Colors.blueGrey.withOpacity(0.7)
                      ]),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(45)),
                      //border: Border.all(style: BorderStyle.solid, width: 1, ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: DecoratedBox(
                        child: Center(
                            child: !_timer.isActive
                                ? Text(questionNumber.toString(),
                                    style: TextStyle(fontSize: 32))
                                : Text((3 - _timer.tick).toString())),
                        decoration: BoxDecoration(
                          gradient: RadialGradient(colors: [
                            Colors.blueGrey.withOpacity(0.7),
                            Colors.blueGrey.withOpacity(0.6)
                          ]),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(45),
                              bottomLeft: Radius.circular(45)),
                          border: Border.all(
                              style: BorderStyle.solid,
                              width: 0,
                              color:
                                  Theme.of(context).canvasColor.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 120,
                  child: DecoratedBox(
                    child: Center(
                        child: isStarted
                            ? Text(
                                points.toString(),
                                style: TextStyle(fontSize: 32),
                              )
                            : Text('POINTS')),
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                        Colors.blueGrey.withOpacity(0.9),
                        Colors.blueGrey.withOpacity(0.7)
                      ]),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(45)),
                      //border: Border.all(style: BorderStyle.solid, width: 1, ),
                    ),
                  ),
                ),
              ],
            ),
            //question
            //answers
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 70,
                        width: 120,
                        child: DecoratedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Center(
                                  child: isStarted
                                      ? Text(
                                          equation.a.toString(),
                                          style: TextStyle(fontSize: 32),
                                        )
                                      : Text('...')),
                              Center(
                                  child: isStarted
                                      ? Icon(getProperIcon(equation.sign))
                                      : Icon(Icons.details)),
                              Center(
                                  child: isStarted
                                      ? Text(equation.b.toString(),
                                          style: TextStyle(fontSize: 32))
                                      : Text('...')),
                            ],
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.blueGrey.withOpacity(0.3),
                              Colors.blueGrey.withOpacity(0.1)
                            ]),
                              //borderRadius: BorderRadius.only(topRight: Radius.elliptical(250, 75), bottomLeft: Radius.elliptical(250, 75)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AnswerButton(
                      Colors.blueGrey, isStarted ? answers[0].toString() : 'A',
                      () {
                    if (isStarted) answerQuestion(answers[0]);
                  }),
                  AnswerButton(Colors.blueGrey.withOpacity(0.7),
                      isStarted ? answers[1].toString() : 'B', () {
                    if (isStarted) answerQuestion(answers[1]);
                  }),
                  AnswerButton(Colors.blueGrey.withOpacity(0.5),
                      isStarted ? answers[2].toString() : 'C', () {
                    if (isStarted) answerQuestion(answers[2]);
                  }),
                  AnswerButton(Colors.blueGrey.withOpacity(0.3),
                      isStarted ? answers[3].toString() : 'D', () {
                    if (isStarted) answerQuestion(answers[3]);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
