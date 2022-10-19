import 'package:flutter/material.dart';
import 'package:new_project/taskData.dart';
import 'package:new_project/tastdeatils.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.blue,
        backgroundColor: Colors.yellow,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.blue, fontSize: 40.0),
        ),
        appBarTheme: AppBarTheme(color: Colors.deepOrange)),
    home: MyHomeApp(),
    routes: {
      '/task': (context) => TaskDetailsPage(),
    },
  ));
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  int Counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("$Counter"),
              FloatingActionButton(
                  onPressed: () {
                    TaskData data =
                        TaskData("buy fruits", "Fresh one", "Today");
                    Navigator.pushNamed(context, '/task', arguments: data);
                  },
                  child: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
