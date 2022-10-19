import 'package:flutter/material.dart';

class PreviewData extends StatefulWidget {
  @override
  _PreviewDataState createState() => _PreviewDataState();
}

class _PreviewDataState extends State<PreviewData> {
  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(
          child: Container(
        child: Text(
          "$name",
          style: TextStyle(fontSize: 30.0),
        ),
      )),
    );
  }
}
