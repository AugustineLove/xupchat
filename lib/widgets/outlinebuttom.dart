import 'package:flutter/material.dart';
import 'package:xup_chat/constants/colors.dart';

class OutlineContainer extends StatelessWidget {
  final String imageUrl;
  final String label;
  const OutlineContainer({super.key, required this.imageUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(width: 35, height: 35, child: Image.asset(imageUrl, fit: BoxFit.cover,),),
        const SizedBox(width: 29,),
        Text(label)
      ],),
    );
  }
}