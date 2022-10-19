import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:sliding_number/sliding_number.dart';
import 'package:number_slide_animation/number_slide_animation.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double values = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller?.forward();

    controller?.addListener(() {
      setState(() {
        values = controller!.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff315ACE),
        title: Text('My Expenses'),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 200,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹",
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                        NumberSlideAnimation(
                            number: "9521",
                            duration: const Duration(seconds: 2),
                            curve: Curves.bounceIn,
                            textStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold)),
                        Text(
                          ".00",
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(top: 150, right: 20.0, left: 20.0),
                child: new Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.white,
                    elevation: 4.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.blueAccent,
                              backgroundColor: Colors.grey,
                              currentValue: 20,
                              animatedDuration: Duration(seconds: 1),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.yellow,
                              backgroundColor: Colors.grey,
                              currentValue: 50,
                              animatedDuration: Duration(milliseconds: 800),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.pink,
                              backgroundColor: Colors.grey,
                              currentValue: 60,
                              animatedDuration: Duration(milliseconds: 800),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.cyanAccent,
                              backgroundColor: Colors.grey,
                              currentValue: 80,
                              animatedDuration: Duration(milliseconds: 800),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.limeAccent,
                              backgroundColor: Colors.grey,
                              currentValue: 40,
                              animatedDuration: Duration(milliseconds: 1000),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.orangeAccent,
                              backgroundColor: Colors.grey,
                              currentValue: 30,
                              animatedDuration: Duration(milliseconds: 1000),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.redAccent,
                              backgroundColor: Colors.grey,
                              currentValue: 69,
                              animatedDuration: Duration(milliseconds: 1000),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FAProgressBar(
                              size: 10,
                              progressColor: Colors.purple,
                              backgroundColor: Colors.grey,
                              currentValue: 40,
                              animatedDuration: Duration(milliseconds: 1000),
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.up),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.bike_scooter,
                        size: 80.0,
                        color: Colors.red.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.terrain,
                        size: 80.0,
                        color: Colors.brown.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.people_alt,
                        size: 80.0,
                        color: Colors.cyan.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 80.0,
                        color: Colors.green.withOpacity(values),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.coffee,
                        size: 80.0,
                        color: Colors.red.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.home,
                        size: 80.0,
                        color: Colors.purple.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.paragliding,
                        size: 80.0,
                        color: Colors.cyan.withOpacity(values),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.savings,
                        size: 80.0,
                        color: Colors.blue.withOpacity(values),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
