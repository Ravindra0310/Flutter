import 'package:flutter/material.dart';

class BalanceBar extends StatelessWidget {
  BalanceBar(
      {required this.value1, required this.value2, required this.value3});
  int value1;
  int value2;
  int value3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    flex: (value1 / 10000 * 10).toInt(),
                    child: Container(
                      color: Colors.red,
                      height: 10.0,
                      width: 100.0,
                    )),
                Expanded(
                    flex: (value2 / 10000 * 10).toInt(),
                    child: Container(
                      color: Colors.cyanAccent,
                      height: 10.0,
                      width: 100.0,
                    )),
                Expanded(
                    flex: (value3 / 10000 * 10).toInt(),
                    child: Container(
                      color: Colors.blue,
                      height: 10.0,
                      width: 100.0,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "$value1",
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              )),
              Expanded(
                  child: Text(
                "$value2",
                style: TextStyle(fontSize: 20.0, color: Colors.cyanAccent),
              )),
              Expanded(
                  child: Text(
                "$value3",
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ))
            ],
          )
        ],
      ),
    );
  }
}
