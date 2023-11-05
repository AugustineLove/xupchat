import 'package:flutter/material.dart';

class TwentyFontSize extends StatelessWidget {
  final String text;
  const TwentyFontSize({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
  }
}