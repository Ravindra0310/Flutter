import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final myController = TextEditingController();
  List<Widget> textList = <Widget>[];

  Widget taskList(String text) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(5),
        child: Card(
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: textList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter task',
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            var data = myController.text;
                            var input = taskList(data);
                            setState(() {
                              textList.add(input);
                            });
                          },
                          color: Colors.blueGrey[100],
                          child: Text('Add Task!'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
