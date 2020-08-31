import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  @override
  void initState(){
    super.initState();
    isSignIn=false;
  }
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  
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
        body: isSignIn 
        ? Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(_user.photoUrl),
                ),
                Text(_user.displayName),
                OutlineButton(
                  onPressed: () {
                    googleSignout();
                  },
                  child:Text("Logout"),
                )
              ],
            ),
          )
        : Center(
            child: OutlineButton(
              onPressed: (){
                handleSignIn();
              },
              child: Text("Sign In With Google"),
            ),
          )
      ),
    );
  }

  bool isSignIn = false;

  Future<void> handleSignIn() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken, 
      accessToken: googleSignInAuthentication.accessToken);
    
    AuthResult result = (await _auth.signInWithCredential(credential));
    
    _user = result.user;
  
    setState(() {
      isSignIn=true;
    });
  }

  Future<void> googleSignout() async
  {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState((){
        isSignIn=false;
      });
    });
  }
}