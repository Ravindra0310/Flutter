import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Networkcall(),
    ),
  ));
}

class Networkcall extends StatefulWidget {
  @override
  _NetworkcallState createState() => _NetworkcallState();
}

class _NetworkcallState extends State<Networkcall> {
  double padding = 20.0;
  String pad = 'aa20.0';

  String dogImgUrl = "";

  void getRandomDog() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonData['message']);
      setState(() {
        dogImgUrl = jsonData['message'];
      });
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRandomDog();
  }

  @override
  Widget build(BuildContext context) {
    try {
      padding = double.parse(pad);
    } catch (e) {
      padding = 30.0;
    }

    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    getRandomDog();
                  },
                  child: Text("My Button")),
              Expanded(
                child: Image(
                    image: NetworkImage(
                  '$dogImgUrl',
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
