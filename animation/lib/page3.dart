import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page3"),
        ),
        body: Center(
          child: Expanded(
              child: Hero(
            tag: 'music',
            child: Container(
              child: Image(
                image: NetworkImage(
                    "https://cdn3.pitchfork.com/longform/869/Overtones_1440x720.jpg"),
              ),
            ),
          )),
        ));
  }
}
