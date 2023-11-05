
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loaders{
  void circularLoader(BuildContext context){
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  void cancelLoader(BuildContext context){
    Navigator.of(context).pop();
  }
}