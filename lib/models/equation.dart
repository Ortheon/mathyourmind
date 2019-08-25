import 'package:flutter/material.dart';
import '../Utils/enums.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Equation {
  var a;
  var b;
  EQUATIONS sign;
  double answer;
  var maxGeneratedNumber = 27; //from difficulty

  //TODO POPRAW TO xD
  void calculateAnswer() {
    switch(sign) {
      case EQUATIONS.PLUS:
        answer = double.parse((a + b).toString());
        break;
      case EQUATIONS.MINUS:
        answer = double.parse((a - b).toString());
        break;
      case EQUATIONS.MULTIPLY:
        answer = double.parse((a * b).toString());
        break;
      case EQUATIONS.DIVIDE:
        answer = double.parse((a / b).toString());
        break;
      case EQUATIONS.SQUAREROOT:
        answer = double.parse((sqrt(a)).toString());
        break;
      case EQUATIONS.POWER:
        answer = double.parse((pow(a, b)).toString());
        break;
    }

//    Future<int> getCountOfSavedSigns() async {
//      final SharedPreferences preferences = await SharedPreferences.getInstance();
//      int count = 0;
//      if(preferences.getBool('add' ?? false) == true) count++;
//      if(preferences.getBool('subtract' ?? false) == true) count++;
//      if(preferences.getBool('multiply' ?? false) == true) count++;
//      if(preferences.getBool('divide' ?? false) == true) count++;
//      if(preferences.getBool('squareroot' ?? false) == true) count++;
//      if(preferences.getBool('power' ?? false) == true) count++;
//
//      return count;
//
//    }

  }

  Equation({this.sign}) {

    if(this.sign == EQUATIONS.POWER || this.sign == EQUATIONS.SQUAREROOT) this.maxGeneratedNumber =  (maxGeneratedNumber/4).round();

    this.a = Random().nextInt(maxGeneratedNumber)+3;
    this.b = Random().nextInt(maxGeneratedNumber)+3;
    while(b==a) this.b = Random().nextInt(maxGeneratedNumber)+3;
    calculateAnswer();
  }



}