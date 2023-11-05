import 'package:flutter/material.dart';
import 'package:xup_chat/constants/colors.dart';

class MyCustomCheckBox extends StatelessWidget {
  final Color fillColor;
   const MyCustomCheckBox({super.key, required this.fillColor});

  @override
  Widget build(BuildContext context) {

    return ClipOval(
                      child: Container(
                        width: 15,
                        height: 15,
                        
                        decoration: BoxDecoration(
                          color: fillColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                          )
                        ),
                      ),
                    );}
}