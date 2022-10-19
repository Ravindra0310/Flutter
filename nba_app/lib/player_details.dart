import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlayerDetail extends StatefulWidget {
  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  var f_name;
  var l_name;
  var position;
  var team;
  var city;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //var playerId = ModalRoute.of(context)!.settings.arguments;
    // fectchTeam(playerId);
  }

  void fectchTeam(var id) async {
    var url = Uri.parse("https://www.balldontlie.io/api/v1/players/$id");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        f_name = jsonData['first_name'];
        l_name = jsonData['last_name'];
        position = jsonData['C'];
        team = jsonData["team"]['full_name'];
        city = jsonData["team"]['city'];
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var playerId = ModalRoute.of(context)!.settings.arguments;
    fectchTeam(playerId);
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
              child: Center(
                  child: Text(
            "Player Name: $f_name" + "" + "$l_name",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ))),
          Expanded(
              child: Center(
                  child: Text(
            "Player position: $position",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ))),
          Expanded(
              child: Center(
                  child: Text(
            "Player Team: $team",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ))),
          Expanded(
              child: Center(
                  child: Text(
            "City: $city",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ))),
        ]),
      ),
    );
  }
}
