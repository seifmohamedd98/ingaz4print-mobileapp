import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ingaz/login.dart';
import 'package:ingaz/splashScreen.dart';
// import 'package:ingaz/categories.dart';
// import 'login.dart';
// import 'signup.dart';
// import "cart.dart";
// import 'business_card.dart';
// import 'flyer.dart';
import 'drawer.dart';
import 'draweradmin.dart';
import 'drawerclient.dart';
import 'drawerinternal.dart';
// import 'header.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingaz Home',
      home: Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          toolbarHeight: 95,
          title: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 80,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      WelcomeMain(),
                      ImageSectionMain(),
                      //SplashScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: getDrawer(),
      ),
    );
  }
}

class WelcomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      height: 230,
      child: Row(
        children: [
          Image.asset(
            'images/welcome.png',
            width: 392,
            height: 170,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}

class ImageSectionMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'images/flyer1.jpg',
              width: 190,
              height: 170,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/flyer2.jpg',
              width: 190,
              height: 170,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}

// CollectionReference users = FirebaseFirestore.instance.collection('users');

// class DrawerSelection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Firestore read'),
//       ),
//       body: StreamBuilder(
//         stream: users.snapshots(),
//         builder: (context, snaphot) {
//           if (!snaphot.hasData) {
//             return Text('Loading Data.. Please Wait');
//             return Column(
//               children: <Widget>[
//                 Text(snaphot.data.documents[0]['Access']),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

getDrawer() {
  if (currentUser == "admin") {
    return HeaderDrawerAdmin();
  } else if (currentUser == "internal") {
    return HeaderDrawerInternal();
  } else if (currentUser == "client") {
    return HeaderDrawerClient();
  } else {
    return HeaderDrawer();
  }
}
