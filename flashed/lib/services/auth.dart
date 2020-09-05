import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashed/models/user.dart';
import 'package:flashed/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid:user.uid) : null;
  }  
  // auth change user stream

  Stream<User> get user {
    // rerturn  all users in stream every time user signs in/out
    return _auth.onAuthStateChanged
      // .map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in w email and pw
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register w email & pw

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;

      await DatabaseService(uid: user.uid).updateUserData('Flashed User', 'flashed.user@example.com', {'Email Weekly':["Yes"]}, ['Elections', 'Artificial Intellignece']);

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}