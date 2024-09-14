import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {

  MyContainer( {required this.colour, this.cardChild} );
  final Color colour;
  final Widget? cardChild ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),

    );
  }
}