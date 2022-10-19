import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskList(),
    child: MaterialApp(
      theme: ThemeData.dark(),
      home: TaskManager(),
    ),
  ));
}

class TaskManager extends StatefulWidget {
  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: Provider.of<TaskList>(context).entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title:
                  Text(Provider.of<TaskList>(context).entries.elementAt(index)),
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text("Update The Task"),
                              content: TextField(
                                controller: myController1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Update',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    TaskList list = Provider.of<TaskList>(
                                        context,
                                        listen: false);
                                    list.update(index, myController1.text);
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.edit)),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    TaskList taskList =
                        Provider.of<TaskList>(context, listen: false);
                    taskList.remove(index);
                  }));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> addTask(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
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
                ElevatedButton(
                  onPressed: () {
                    var data = myController.text;
                    TaskList taskList =
                        Provider.of<TaskList>(context, listen: false);
                    taskList.add(data);
                  },
                  child: Text('Add Task!'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TaskList extends ChangeNotifier {
  List<String> entries = <String>['Ravi', 'Solanki'];

  void add(String task) {
    entries.add(task);
    notifyListeners();
  }

  void remove(int index) {
    entries.removeAt(index);
    notifyListeners();
  }

  void update(int index, String task) {
    entries[index] = task;
    notifyListeners();
  }
}
