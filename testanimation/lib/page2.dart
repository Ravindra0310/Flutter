import 'package:flutter/material.dart';
import 'package:testanimation/my_widget.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'image',
              child: Container(
                  child: Image(
                height: 200.0,
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
              )),
            ),
            MyWidget(
                color1: Colors.red,
                color2: Colors.blue,
                color3: Colors.green,
                child: Text("Hello My widget"))
          ],
        ),
      ),
    );
  }
}
