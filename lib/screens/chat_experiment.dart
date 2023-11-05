import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:xup_chat/models/message.dart';
import 'package:http/http.dart' as http;

class MyListExperiment extends StatefulWidget {
  const MyListExperiment({super.key});

  @override
  State<MyListExperiment> createState() => _MyListExperimentState();
}

class _MyListExperimentState extends State<MyListExperiment> {
  Future<Message> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200){
      return Message.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('THere is an error in somewhere of your code');
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}