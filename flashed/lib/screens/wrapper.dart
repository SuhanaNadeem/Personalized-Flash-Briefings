import 'package:flashed/screens/home/home.dart';
import 'package:flashed/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // return either Home or Authenticate widget
    return Authenticate();
    
  }
}