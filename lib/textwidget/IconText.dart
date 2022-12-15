import 'package:e_commerceapp/textwidget/Smalltext.dart';
import 'package:flutter/material.dart';
class IconText extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Color Iconcolor;
  const IconText({Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.Iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Iconcolor,),
        const SizedBox(width: 5,),
        Smalltext(color: color, text: text),
      ],
    );
  }
}
