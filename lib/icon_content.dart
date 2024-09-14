
import 'package:flutter/material.dart';

class IconContents extends StatelessWidget {

  IconContents( { required this.iconData, required this.label});
  final IconData iconData ;
  final String label ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(
          iconData ,
          color: Colors.white,
          size: 80.0,

        ),
        SizedBox(height: 15.0,),
        Text( label,style: TextStyle(
            fontSize: 18,
            color: Colors.white
        ),),
      ],
    );
  }
}
