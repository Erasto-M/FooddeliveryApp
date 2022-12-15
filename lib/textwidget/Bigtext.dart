import 'package:flutter/material.dart';
class Bigtext extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
   Bigtext({Key? key,
    required this.color,
    this.size =20,
     this.textOverflow = TextOverflow.ellipsis,
     required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
      ),

    );
  }
}

