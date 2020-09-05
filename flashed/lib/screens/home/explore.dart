import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  
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
      color: Colors.yellow,
    );
  }

}