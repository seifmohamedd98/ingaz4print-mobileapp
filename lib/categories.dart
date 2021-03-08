import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:ingaz/main.dart';
import 'samples.dart';

String category;

class Categories extends StatelessWidget {

  List< String> categories = [];

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
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Container
        (
          alignment: Alignment.center,
          child: StreamBuilder
          (
            stream: FirebaseFirestore.instance.collection("category").snapshots(),
            builder: (context, snapshot)
            {
              if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 

              for(var document in snapshot.data.docs)
              {
                categories.add(document["name"]);
              }
              categories = categories.toSet().toList();
            
            
            
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: categories.map((String data) {
                  return CategoryButton(data);

                }).toList()
              );
            }
          )
        ),
      ),
    );
  }
}



class CategoryButton extends StatelessWidget
{
  String _name;

  CategoryButton(name)
  {
    this._name = name;
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    padding: EdgeInsets.only(top: 20.0),
    child: FloatingActionButton
    (
      heroTag: _name,
      onPressed: () 
      { 
        category = _name;
         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Samples()
            )
         );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: Colors.yellow[700],
      child: Text
      (
        _name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  );
}




}