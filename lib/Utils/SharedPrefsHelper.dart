import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPrefsHelper {
  //Stored play settings
  static final bool addInPlay = true;
  static final bool subtractInPlay = true;
  static final bool multiplyInPlay = false;
  static final bool divideInPlay = false;

  static Future<bool> getAddInPlay() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('addInPlay');
  }
  static Future<bool> setAddInPlay(bool t) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool('addInPlay', t);
  }

  //TODO add more methods
}