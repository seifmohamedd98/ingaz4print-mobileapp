import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ingaz/login.dart';
import 'package:ingaz/main.dart';
import 'package:ingaz/services/auth.dart';
import 'package:ingaz/drawerclient.dart';
import 'package:ingaz/draweradmin.dart';

import 'drawerinternal.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

CollectionReference users = FirebaseFirestore.instance.collection('users');

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Auth().getUser().listen((user) {
      debugPrint("user: " + user.toString());

      if (user != null && user.uid != null) {
        //go to home page
        //if condition law el access=='Admin' && email= AdminEmail && password =="AdminPassword"
        //roh e3ml navigation 3la el page beta3et el admin w else if tani w else

        // users.snapshots();
        // (context, snapshot) {
        //   if (!snapshot.hasData) {
        //     snapshot.data.document.map((document) {
        // if (email == document['E-mail'] &&
        //     document['Access'] == 'client') {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (_) => HeaderDrawerClient()));
        // }
        // if (email == document['E-mail'] &&
        //     document['Access'] == 'admin') {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (_) => HeaderDrawerAdmin()));
        // }
        // if (email == document['E-mail'] &&
        //     document['Access'] == 'internal') {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (_) => HeaderDrawerInternal()));
        // }
        //     });
        //   }
        // };

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => HeaderDrawerClient()));
      } else {
        // Go to login page
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
