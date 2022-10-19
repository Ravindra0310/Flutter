import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> fruits = [
    'Oranges',
    'Apples',
    'Bananas',
    'Oranges',
    'Apples',
    'Bananas'
  ];
  String? cartItem = 'No Items';
  List<DropdownMenuItem<String>> getItems() {
    List<DropdownMenuItem<String>> items = [];
    fruits.forEach((element) {
      var eachItem = DropdownMenuItem(
        child: Text('$element'),
        value: element,
      );
      items.add(eachItem);
    });
    return items;
  }

  DropdownButton getAndroiDropDown() {
    return DropdownButton<String>(
      value: 'Apples',
      items: getItems(),
      onChanged: (value) {
        setState(() {
          cartItem = value;
        });
      },
    );
  }

  CupertinoPicker getIosDropDown() {
    List<Widget> list = [];
    fruits.forEach((element) {
      list.add(Text('$element'));
    });
    return CupertinoPicker(
        itemExtent: 30.0,
        onSelectedItemChanged: (onSelectedItemChanged) {
          setState(() {
            cartItem = fruits[onSelectedItemChanged];
          });
        },
        children: list);
  }

  Widget? getPlatfmormSpecificWidget() {
    if (Platform.isIOS) {
      return getIosDropDown();
    } else {
      return getAndroiDropDown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: getPlatfmormSpecificWidget(),
            ),
          ),
          SizedBox(
            height: 10.0,
            width: 30.0,
          ),
          Expanded(
            child: Text('$cartItem'),
          ),
        ],
      ),
    );
  }
}
