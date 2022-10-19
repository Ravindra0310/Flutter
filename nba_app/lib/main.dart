import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app/player_details.dart';
import 'dart:convert' as convert;

import 'package:nba_app/players.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': (context) => Teams(),
      '/player': (context) => Players(),
      '/playerDetails': (context) => PlayerDetail()
    },
  ));
}

class Teams extends StatefulWidget {
  @override
  _TeamsState createState() => _TeamsState();
}

bool isloading = false;

class _TeamsState extends State<Teams> {
  List<Widget> teamslist = [];
  List<dynamic> users = [];
  @override
  void initState() {
    super.initState();
    fectchTeam();
  }

  void fectchTeam() async {
    var url = Uri.parse("https://www.balldontlie.io/api/v1/teams");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        users = jsonData['data'];
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.sports_basketball,
          color: Colors.white,
          size: 40.0,
        ),
        title: Text("NBA Teams"),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    var id = users[index]['full_name'].toString();
                    Navigator.pushNamed(context, '/player', arguments: id);
                  },
                  tileColor: Colors.black87,
                  title: Center(
                    child: Text(
                      users[index]['full_name'].toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}
