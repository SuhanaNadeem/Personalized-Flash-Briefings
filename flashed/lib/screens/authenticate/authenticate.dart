import 'package:flashed/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flashed/screens/authenticate/register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  //switch states 
  void toggleView() {
    setState(() => showSignIn = !showSignIn); 
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  
  }
}