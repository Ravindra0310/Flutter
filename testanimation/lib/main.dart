import 'package:flutter/material.dart';
import 'package:testanimation/my_widget.dart';
import 'package:testanimation/newpage.dart';
import 'package:testanimation/page2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => NewPage(),
      '/page2': (context) => Page2(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double? value = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), upperBound: 100);

    var curve = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    controller?.forward();
    controller?.addListener(() {
      setState(() {
        value = controller!.value;
      });
      print(curve.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(1),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              MyWidget(
                  color1: Colors.red,
                  color2: Colors.blue,
                  color3: Colors.green,
                  child: Text("ok")),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "page2",
                    style: TextStyle(
                      fontSize: value,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/page2');
                },
              ),
              SizedBox(
                height: value,
              ),
              Hero(
                tag: 'image',
                child: Container(
                    child: Image(
                  height: value,
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
