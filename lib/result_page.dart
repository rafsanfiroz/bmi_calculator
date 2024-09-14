import 'package:flutter/material.dart';
import 'bmi_result_calculate.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({super.key});
  ResultPage(
      {required this.bmiCalculator,
      required this.getResult,
      required this.interpretation});

  final String bmiCalculator;

  final String getResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Text(
              'Your BMI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResult.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    bmiCalculator.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    interpretation.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              )),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'RE-Calculate',
                style: TextStyle(
                    // backgroundColor: Colors.pink,
                    ),
              ),
            ),
            margin: EdgeInsets.only(top: 10.0),
            color: Color(0xFFEB1555),
            height: 70.0,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
