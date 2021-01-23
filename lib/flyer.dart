import 'package:flutter/material.dart';
import 'package:ingaz/flyer_maker.dart';

class Flyer extends StatelessWidget {
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ingaz 4 print',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 80,
          ),
          toolbarHeight: 95,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              TitleSectionFlyer(),
              FlyerMakeProduct(),
              // Padding(
              //   padding: EdgeInsets.only(top: 5),
              //   child: Text(
              //     "Samples of Flyers",
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: Colors.yellow[800],
              //     ),
              //   ),
              // ),
              ImageSectionFlyer(),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSectionFlyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Flyer:-',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlyerMakeProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 8),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlyerMaker(),
            ),
          );
        },
        color: Colors.yellow[700],
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Make Your Own Product',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSectionFlyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          //First Picture
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'images/flyer1.jpg',
              width: 300,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Flyer Sample 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Second Picture
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'images/flyer2.jpg',
              width: 300,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Flyer Sample 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
