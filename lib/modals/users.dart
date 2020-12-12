import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Users {
  final String id;
  final String userName;
  final String email;
  final String photoUrl;
  final String descp;

  Users(
      {@required this.id,
      this.userName,
      this.email,
      this.photoUrl,
      this.descp});
  factory Users.createUser(FirebaseUser firebaseUser) {
    return Users(
        id: firebaseUser.uid,
        userName: firebaseUser.displayName,
        photoUrl: firebaseUser.photoUrl,
        email: firebaseUser.email);
  }

  factory Users.createDocument(DocumentSnapshot documentSnapshot) {
    return Users(
        id: documentSnapshot.documentID,
        userName: documentSnapshot["userName"],
        photoUrl: documentSnapshot["photoUrl"],
        descp: documentSnapshot["descp"],
        email: documentSnapshot["email"]);
  }
}
