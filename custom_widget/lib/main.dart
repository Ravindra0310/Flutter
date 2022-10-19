import 'package:custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BalanceBar(
            value1: 1000,
            value2: 6000,
            value3: 4000,
          )),
        ],
      ),
    ),
  ));
}
