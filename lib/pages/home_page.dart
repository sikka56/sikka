import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sikka/events/event1.dart';
import 'package:sikka/events/event3.dart';
import 'package:sikka/events/event4.dart';
import 'package:sikka/events/whennoevent.dart';
import 'package:sikka/services/aunthication.dart';
import 'package:intl/intl.dart';

import 'login_signup_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  String _timeString;
 String ctime;
  @override
  void initState() {
    //_timeString = _formatDateTime(DateTime.now());
    //Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    DateTime now =DateTime.now();
   ctime = DateFormat("kk:mm:ss").format(now);


    super.initState();
    List l =ctime.split(":");
      print(l);
    var hour = int.parse(l[0]);

      if(hour>7 && hour<12){

Navigator.push(context,MaterialPageRoute(builder: (context)=>Event1()));
  }
   if(hour>11 && hour<15){

Navigator.push(context,MaterialPageRoute(builder: (context)=>Event2()));
  }

   if(hour>14 && hour<18){

Navigator.push(context,MaterialPageRoute(builder: (context)=>Event3()));
  }
   if(hour>17 && hour<21){

Navigator.push(context,MaterialPageRoute(builder: (context)=>Event4()));
  }

  else{
    Navigator.push(context,MaterialPageRoute(builder: (context)=>NoEvent()));
  }
  
  }

  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   print(now.toString);

  //   final String formattedDateTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedDateTime;
  //   });
  // }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('sikka'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: Container(
        //     child: Column(children: [
        //   Card(child: Text("Event No:-1", style: TextStyle(fontSize: 30))),
        //   SizedBox(height: 10),
        //   Row(
        //     children: <Widget>[
        //       Text("Select Your one Color:-", style: TextStyle(fontSize: 20)),
        //     ],
        //   ),
        //   Row(children: [
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.red,
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.yellow,
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.blue,
        //       ),
        //     )
        //   ]),
        //   SizedBox(height: 20),
        //   Row(children: [
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.green,
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.orange,
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //     Container(
        //       height: 100,
        //       width: 100,
        //       child: Card(
        //         color: Colors.black,
        //       ),
        //     )
        //   ]),
        //   SizedBox(height: 30),
        //   Row(
        //     children: <Widget>[
        //       Card(
        //         elevation: 10,
        //         shadowColor: Colors.black12,
        //         child: Column(
        //           children: <Widget>[
        //             Text("Time remaining in live event:",
        //                 style: TextStyle(fontSize: 20)),
        //             SizedBox(
        //               height: 10,
        //             ),
        //             Text(ctime, style: TextStyle(fontSize: 20)),
        //           ],
        //         ),
        //       ),
        //     ],
        //   )
        // ])
        
        )
        );
  }
}

class Event2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Second 2")));
  }
}
