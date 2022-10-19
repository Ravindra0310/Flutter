import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  final myController = TextEditingController();
  @override
  void initState() {
    List<Widget> textlist = <Widget>[Editext(), Editext()];
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget Editext() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Enter Text"),
      ),
    );
  }

  List<Widget> textlist = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: textlist,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  alignment: Alignment.topRight,
                  width: 25.0,
                  height: 25.0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        textlist.add(Editext());
                      });
                    },
                    icon: Icon(Icons.add),
                  )),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/data',
                  arguments: myController.text);
            },
            child: Text("Preview Data"),
          )
        ],
      ),
    );
  }
}
