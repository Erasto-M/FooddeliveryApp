import 'package:flutter/material.dart';

class Smalltext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  Smalltext({Key? key,
    required this.color,
    this.height=1.2,
    this.size =12,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          height: height,

      ),

    );
  }
}
