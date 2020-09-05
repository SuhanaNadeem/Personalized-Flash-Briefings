import 'package:flutter/material.dart';
import 'package:flashed/services/auth.dart';
import 'package:flashed/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashed/screens/home/landing.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().profiles,
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar (
            title: Text("Flashed"),
            backgroundColor: Colors.blue[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async{
                  await _auth.signOut();
                },

              )
            ],
          ),
          body: Landing(),
        ),
      );
  }
}