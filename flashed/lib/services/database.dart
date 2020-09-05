import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashed/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });
  // collection reference
  final CollectionReference profileCollection = Firestore.instance.collection('profiles');

  Future updateUserData(String name, String email, Map preferences, List topics) async {
    return await profileCollection.document(uid).setData({
      'name': name,
      'email': email,
      'preferences': preferences,
      'topics': topics,
    });
  }

  // get profiles stream
  Stream<QuerySnapshot> get profiles {
    
    return profileCollection.snapshots();
  }

}