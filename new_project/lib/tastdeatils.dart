import 'package:flutter/material.dart';
import 'package:new_project/taskData.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);

  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as TaskData;

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Text(
                  "Title=${data.title} \n Desc = ${data.desc} \n date =${data.date}"))
        ],
      ),
    );
  }
}
