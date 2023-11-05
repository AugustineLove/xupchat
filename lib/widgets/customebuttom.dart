import 'package:flutter/material.dart';
import 'package:xup_chat/constants/colors.dart';

class MyCustomButtom extends StatelessWidget {
  final String label;
  const MyCustomButtom({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(label, style: const TextStyle(color: AppColors.whiteColor, fontSize: 20, fontWeight: FontWeight.w600,),)),
    );
  }
}