import 'package:flutter/material.dart';

class ShowResult extends StatefulWidget {
  const ShowResult({Key? key}) : super(key: key);

  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Result"),
        ),
        body: Center(
          child: Card(
              elevation: 20,
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: SizedBox(
                height: 100,
                child: Center(
                    child: Text('$data', style: TextStyle(fontSize: 50))),
              )),
        ));
  }
}
