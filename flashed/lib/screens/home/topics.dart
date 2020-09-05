import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  
  @override
  Widget build(BuildContext context) {

    final profiles = Provider.of<QuerySnapshot>(context);
    //print(profiles.documents);
    if (profiles != null){
      for (var doc in profiles.documents) {
        print(doc.data);
      }
    }

    return Container(
      color: Colors.pink,
    );
  }

}