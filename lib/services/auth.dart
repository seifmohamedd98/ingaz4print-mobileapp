import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:ingaz/services/database.dart';
//import 'package:ingaz/services/database.dart';

class Auth with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  DateTime expireDate;
  String email;
  String userID;
  String username;
  Timer _authTimer;

  Future SignUp(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    // var user = authResult.user;
    // await DatabaseManager(uid: user.uid).updateUser();

    return authResult;
  }

  Future SignIn(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }

  Stream<User> getUser() {
    return FirebaseAuth.instance.userChanges();
  }

  Future<bool> signOut() async {
    await _auth.signOut();
    print('User Signed Out');
  }
}
