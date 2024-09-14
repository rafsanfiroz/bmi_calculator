import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';
class Calculator {
  late double bmi;
  Calculator({required this.weight, required this.height});
  final int height;
  final int weight;
  String CalculateBmi() {
    bmi = weight / pow(height/100, 2) ;
    return bmi.toStringAsFixed(1);
  }
  String getResult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String interPretation() {
    if (bmi >= 25) {
      return 'Do excercise';
    } else if (bmi >= 18.5) {
      return 'Goodjob';
    } else {
      return 'Eat More';
    }
  }
}
