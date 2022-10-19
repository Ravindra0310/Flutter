import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Data(),
    child: MaterialApp(
      home: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void updatecount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                  child: Text(
                "$count",
                style: TextStyle(fontSize: 30.0),
              )),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Data data = Provider.of<Data>(context, listen: false);
                  data.addIteam();
                },
                child: Text("++"),
              ),
            ),
            Expanded(child: level2())
          ],
        ),
      )),
    );
  }
}

class level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: Column(
          children: Provider.of<Data>(context).Widgetlist,
        ),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  List<Expanded> Widgetlist = [Expanded(child: Text('1'))];

  void addIteam() {
    Widgetlist.add(Expanded(child: Text('1')));
    notifyListeners();
  }
}
