import 'package:flutter/material.dart';
import 'package:statefulform/page1.dart';
import 'package:statefulform/preview.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => form(),
      '/data': (context) => PreviewData(),
    },
  ));
}
