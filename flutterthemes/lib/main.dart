import 'package:flutter/material.dart';
import 'package:flutterthemes/resultpage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: myApp(),
    routes: {
      '/result': (context) => ShowResult(),
    },
  ));
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int weight = 60;
  int height = 150;
  int age = 20;

  var check;

  var show = "";
  void SetResult(var data) {
    if (data <= 18.49) {
      show = "underweight";
    } else if (data > 18.49 && data < 24.99) {
      show = "normal weight";
    } else if (data > 25 && data < 29.99) {
      show = "overweight";
    } else if (data > 30) {
      show = "obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu),
        actions: [
          Icon(
            Icons.alarm,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 0),
            child: Text(
              "Gender",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 170.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male_outlined,
                                  size: 120.0,
                                ),
                                Radio(
                                  value: 1,
                                  activeColor: Colors.green,
                                  groupValue: check,
                                  onChanged: (value) {
                                    setState(() {
                                      check = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(
                            "Male",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: 170.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 120.0,
                                ),
                                Radio(
                                  value: 2,
                                  activeColor: Colors.green,
                                  groupValue: check,
                                  onChanged: (value) {
                                    setState(() {
                                      check = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(
                            "Female",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 8.0, 0),
            child: Text(
              "Weight",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 3, 30, 3),
                          child: Text(
                            "$weight",
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    )),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                  child: Center(
                    child: Text(
                      "Kg",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 8.0, 0),
            child: Text(
              "height",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  height--;
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 3, 30, 3),
                          child: Text(
                            "$height",
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  height++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    )),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                  child: Center(
                    child: Text(
                      "cm",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 8.0, 0),
            child: Text(
              "Age",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 3, 100, 3),
                            child: Text(
                              "$age",
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 3, 10, 3),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      setState(() {
                        var foot = height * 0.0328084;
                        var bmi = (weight / foot) * 2;
                        SetResult(bmi);
                        Navigator.pushNamed(context, '/result',
                            arguments: show);
                      });
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
