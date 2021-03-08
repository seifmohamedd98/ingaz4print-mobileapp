import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'category_maker.dart';
import 'categories.dart';

class Samples extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(),
              CategoryButton(),
              // Padding(
              //   padding: EdgeInsets.only(top: 5),
              //   child: Text(
              //     "Samples of Business Cards",
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: Colors.yellow[800],
              //     ),
              //   ),
              // ),
              ImageSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    
                    category,
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

class CategoryButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    padding: EdgeInsets.only(top: 10.0),
    child: FloatingActionButton
    (
      heroTag: "Make You Own Product Button",
      onPressed: () 
      { 
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryMaker()
            )
         );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: Colors.yellow[700],
      child: Text
      (
        "Make you own product",
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    ),
  );
}
}

class ImageSection extends StatelessWidget {
  
  List<Map<String, String>> imagePaths= [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: StreamBuilder
      (
        stream: FirebaseFirestore.instance.collection("category_samples").where("category", isEqualTo: category).snapshots(),
        builder: (context, snapshot)
        {
          if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 
          for(var document in snapshot.data.docs)
          {
            imagePaths.add({"category": document["category"], "description": document["description"], "image": document["image"]});
          }
          imagePaths.toSet().toList();

          return Column(
            children: imagePaths.map((Map<String, String> data) {
              //First Picture
              return ImageSample(data);
            }).toList()

            
          );
        }
      )
    );
  }
}

class ImageSample extends StatelessWidget
{
  Map<String, String> _image;
  ImageSample(image)
  {
    this._image = image;
  }

  @override
  Widget build(BuildContext context) 
  {
    return Column(
      children: 
      [
      Image.file(new File(
        _image["image"]),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.width*0.5,
        fit: BoxFit.fill,
        ),
        Container
        (
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            _image["description"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        )
      ]
    );
    
    
    
  }
}