import 'package:flutter/material.dart';
import 'notebook_maker.dart';

class Notebook extends StatelessWidget {
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
              TitleSectionNotebook(),
              NotebookMakeProduct(),
              // Padding(
              //   padding: EdgeInsets.only(top: 5),
              //   child: Text(
              //     "Samples of Notebooks",
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: Colors.yellow[800],
              //     ),
              //   ),
              // ),
              ImageSectionNotebook(),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSectionNotebook extends StatelessWidget {
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
                    'Notebook:-',
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

class NotebookMakeProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 8),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotebookMaker(),
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

class ImageSectionNotebook extends StatelessWidget {
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
              'images/notebook1.jpg',
              width: 300,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Notebook Sample 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Second Picture
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'images/notebook2.jpg',
              width: 300,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Notebook Sample 2',
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
