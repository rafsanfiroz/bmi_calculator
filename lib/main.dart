import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.red ,
          scaffoldBackgroundColor: Color(0xFF0B1134),
          appBarTheme: AppBarTheme(
              color: Color(0xFF0B1134),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ))),
      home: InputPage(),
    );
  }
}
