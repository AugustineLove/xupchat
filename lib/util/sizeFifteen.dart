import 'package:flutter/material.dart';

class FifteenFontSize extends StatelessWidget {
  final String text;
  const FifteenFontSize({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 15),);
  }
}