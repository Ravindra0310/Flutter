import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Color b1 = Colors.blue;
  Color b2 = Colors.blue;
  Color b3 = Colors.blue;
  Color b4 = Colors.blue;

  bool isClicked = false;
  void answer(int num) {
    if (isClicked == false) {
      setState(() {
        if (num == 1) {
          b1 = Colors.red;
        } else if (num == 2) {
          b2 = Colors.red;
        } else if (num == 3) {
          b3 = Colors.green;
        } else if (num == 4) {
          b4 = Colors.red;
        }
      });
    }
    isClicked = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question1"),
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Is it possible to have an activity without UI to perform action/actions?",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: b1,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              "A - Not possible",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              answer(1);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: b2,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              "B - Wrong question",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              answer(2);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: b3,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              "C - Yes, it is possible",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              answer(3);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: b4,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              "D - None of the above",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              answer(4);
            },
          ),
          SizedBox(
            height: 200.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              "Next Question",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/q2');
            },
          )
        ],
      ),
    );
  }
}
