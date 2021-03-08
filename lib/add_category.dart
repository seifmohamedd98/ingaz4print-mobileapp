import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/admin.dart';
import 'models/category.dart';
import 'models/paper.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//Initializing admin
Admin admin = new Admin();

//final data = category.getCategory("Business Card");
Category c=new Category("Business Card", 1, 0.0);
Paper p=new Paper("Standard (50.8 x 88.9 mm)", "Matte", "150gsm", c, "Single Sided");

//Category c=new Category("Notebook", 1,0.0);
//Paper p=new Paper(size: "A5 (210 x 148 mm)", weight: "135gsm", side: "Single Sided", category: c);



class AddCategory extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ingaz 4 Print',
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
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Add Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              AddCategoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class AddCategoryForm extends StatefulWidget {
  @override
  AddCategoryFormState createState() {
    return AddCategoryFormState();
  }
}

class AddCategoryFormState extends State<AddCategoryForm> {
  final _formKey = GlobalKey<FormState>();


  

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final initalAddedPriceController = TextEditingController();
    final maxPaperQuantityController = TextEditingController();

    double num = 0;
    return Form(
      key: _formKey,

     child: Column(children: <Widget>[   
            // Category Name
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'New Category name',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Category name';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //Added Initial Price
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: initalAddedPriceController,
                decoration: InputDecoration(
                  hintText: 'Price added regardless of paper price',
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter price';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            // Max Paper Quantity
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: maxPaperQuantityController,
                decoration: InputDecoration(
                  hintText: 'Ex: Notebook has 200, Flyer has 1, etc',
                  labelText: 'Max Paper Quantity',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Max Paper Quantity';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            // Submit Button
            RaisedButton(
              onPressed: () {

                if (_formKey.currentState.validate()) {
                  print('The Form is Valid');
                }
                admin.addCategory(nameController.text, double.parse(initalAddedPriceController.text), int.parse(maxPaperQuantityController.text));
                
              },
              color: Colors.yellow[700],
              child: Text(
                'Add Category',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ]
        ));
  }
  
}
