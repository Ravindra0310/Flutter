import 'package:animation/page2.dart';
import 'package:animation/page3.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Listeing"),
      ),
      body: MyApp(),
    ),
    routes: {'/page2': (context) => Page2(), '/page3': (context) => Page3()},
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? sizeAnimation;
  Animation? sizeAnimation2;
  Animation? sizeAnimation3;
  Animation? sizeAnimation4;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    sizeAnimation = Tween<double>(begin: 30.0, end: 100.0).animate(controller!);

    sizeAnimation2 =
        Tween<double>(begin: 50.0, end: 120.0).animate(controller!);
    sizeAnimation3 =
        Tween<double>(begin: 60.0, end: 100.0).animate(controller!);
    sizeAnimation4 = Tween<double>(begin: 40.0, end: 90.0).animate(controller!);

    controller?.addListener(() {
      setState(() {});
    });

    controller?.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page2");
              },
              child: Text("2nd Animation")),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: sizeAnimation?.value,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: sizeAnimation2?.value,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Color(0xffFE5959),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: sizeAnimation3?.value,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Color(0xffF7BA33),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: sizeAnimation4?.value,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Color(0xff3FA85A),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
          ),
          Text(
            "Listening...",
            style: TextStyle(fontSize: 30.0),
          )
        ],
      ),
    );
  }
}
