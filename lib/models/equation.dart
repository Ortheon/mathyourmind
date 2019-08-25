import 'package:flutter/material.dart';
import '../Utils/enums.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Equation {
  var a;
  var b;
  EQUATIONS sign;
  var answer;
  var maxGeneratedNumber = 20; //from difficulty

  //TODO POPRAW TO xD
  void calculateAnswer() {
    switch(sign) {
      case EQUATIONS.PLUS:
        answer = a + b;
        break;
      case EQUATIONS.MINUS:
        answer = a-b;
        break;
      case EQUATIONS.MULTIPLY:
        answer = a * b;
        break;
      case EQUATIONS.DIVIDE:
        answer = a/b;
        break;
      case EQUATIONS.SQUAREROOT:
        answer = sqrt(a);
        break;
      case EQUATIONS.POWER:
        answer = pow(a, b);
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

    this.a = Random().nextInt(maxGeneratedNumber)+1;
    this.b = Random().nextInt(maxGeneratedNumber)+1;
    calculateAnswer();
  }



}