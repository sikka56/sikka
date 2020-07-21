import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sikka/services/aunthication.dart';

class Event1 extends StatefulWidget {
  @override
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  String userid;
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: [
          Card(child: Text("Event No:-1", style: TextStyle(fontSize: 30))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[Text("Event time: 9 A.M to 12 A.M")],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text("Select Your one Color:-", style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 30),
          Row(children: [
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.red,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.yellow,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.blue,
              ),
            )
          ]),
          SizedBox(height: 20),
          Row(children: [
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.green,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              child: Card(
                color: Colors.black,
              ),
            )
          ]),
          SizedBox(height: 30),
          Text(userid)
        ])),
      ),
    );
  }
}
