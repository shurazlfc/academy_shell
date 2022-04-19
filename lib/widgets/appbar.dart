import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  final String title;
  final action;
  const AppBarCustom({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(widget.title),
      actions: widget.action ?? null,
    );
  }
}
