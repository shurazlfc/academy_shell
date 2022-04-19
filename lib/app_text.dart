import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  AppText({Key? key, required this.text, this.color, this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Theme.of(context).textTheme.bodyText1!.color,
          fontSize: size,
          fontWeight: FontWeight.normal),
    );
  }
}
