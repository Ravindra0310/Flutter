import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/question2.dart';
import 'package:quizapp/result.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Question(),
      '/q2': (context) => Question2(),
      '/result': (context) => Result(),
    },
  ));
}
