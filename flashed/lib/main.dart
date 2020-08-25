import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Google Authentication"),
        ),
        body: Center(
          child: OutlineButton(
            onPressed: (){},
            child: Text("Sign in with Google"),
          ),
        ),
      ),
    );
  }
}