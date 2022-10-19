import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  AlertDialog getAndroid(BuildContext context) {
    return AlertDialog(
      title: Text('Dialog Title'),
      content: Text('Dialog Description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text('OK'),
        ),
      ],
    );
  }

  CupertinoAlertDialog getIOS() {
    return CupertinoAlertDialog(
      title: new Text("Dialog Title"),
      content: new Text("This is my content"),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Yes'),
        ),
        CupertinoDialogAction(
          child: Text('No'),
        )
      ],
    );
  }

  Widget getPlatform(BuildContext context) {
    if (Platform.isIOS) {
      return getIOS();
    } else {
      return getAndroid(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page3"),
        ),
        body: Center(
            child: Hero(
          tag: 'music',
          child: Container(
            width: 300,
            height: 200,
            padding: new EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/page3");
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.red,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album, size: 60),
                      title:
                          Text('Sonu Nigam', style: TextStyle(fontSize: 30.0)),
                      subtitle: Text('Best of Sonu Nigam Music.',
                          style: TextStyle(fontSize: 18.0)),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('Play'),
                          onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  child: getPlatform(context),
                                );
                              }),
                        ),
                        RaisedButton(
                          child: const Text('Pause'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}

class MyStatelessWidget extends StatelessWidget {
  AlertDialog getAndroid(BuildContext context) {
    return AlertDialog(
      title: Text('Dialog Title'),
      content: Text('Dialog Description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text('OK'),
        ),
      ],
    );
  }

  CupertinoAlertDialog getIOS() {
    return CupertinoAlertDialog(
      title: new Text("Dialog Title"),
      content: new Text("This is my content"),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Yes'),
        ),
        CupertinoDialogAction(
          child: Text('No'),
        )
      ],
    );
  }

  Widget getPlatform(BuildContext context) {
    if (Platform.isIOS) {
      return getIOS();
    } else {
      return getAndroid(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: getPlatform(context),
            );
          }),
      child: Text('Show Dialog'),
    );
  }
}
