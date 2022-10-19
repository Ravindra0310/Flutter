import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  List<Widget> teamslist = [];
  List<dynamic> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fectchTeam();
  }

  void fectchTeam() async {
    var url = Uri.parse("https://www.balldontlie.io/api/v1/players");
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
    var teamId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person,
          size: 40.0,
        ),
        title: Text("Players"),
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
                    var player_id = users[index]['id'].toString();

                    Navigator.pushNamed(context, '/playerDetails',
                        arguments: player_id);
                  },
                  tileColor: Colors.black87,
                  title: Center(
                    child: Text(
                      "${users[index]['first_name'].toString()}" +
                          " " +
                          "${users[index]['last_name'].toString()}",
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
