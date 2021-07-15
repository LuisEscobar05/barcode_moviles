import 'package:flutter/material.dart';
import 'package:flutter_provider/src/models/user.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UsersView extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<UsersView> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.white70,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: new NetworkImage(users[index].picture),
                ),
                title: new Text(
                  users[index].fullName(),
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: new Text(users[index].email),
              ),
            );
          }),
    );
  }

  Future getRequest() async {
    var url = Uri.parse('https://randomuser.me/api/?results=100');
    final response = await http.get(url);
    final jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonResponse['results']);
    int index = 0;
    for (var user in jsonResponse['results']) {
      User data = User(
        index: index,
        title: user['name']['title'],
        first: user['name']['first'],
        last: user['name']['last'],
        picture: user['picture']['medium'],
        email: user['email'],
      );
      setState(() {
        users.add(data);
      });
      index++;
    }
  }
}
