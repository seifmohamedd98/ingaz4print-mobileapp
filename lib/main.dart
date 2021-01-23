import 'package:flutter/material.dart';
// import 'package:ingaz/categories.dart';
// import 'login.dart';
// import 'signup.dart';
// import "cart.dart";
// import 'business_card.dart';
// import 'flyer.dart';
import 'drawer.dart';
// import 'header.dart';

void main() {
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
        body: SafeArea(
          child: Column(
            children: [
              WelcomeMain(),
              ImageSectionMain(),
            ],
          ),
        ),
        drawer: HeaderDrawer(),
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
    );
  }
}
