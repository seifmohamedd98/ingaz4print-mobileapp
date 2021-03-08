import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/admin.dart';
import 'models/category.dart';
import 'models/paper.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//Initializing admin
Admin admin = new Admin();

//final data = category.getCategory("Business Card");
//Category c=new Category("Business Card", 1, 0.0);
//Paper p=new Paper("Standard (50.8 x 88.9 mm)", "Matte", "150gsm", c, "Single Sided");

Category c=new Category("Notebook", 1,0.0);
Paper p=new Paper("A5 (210 x 148 mm)","Glossy", "135gsm", c, "Single Sided"); 



class AddPaperProperty extends StatelessWidget {
  
  
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
                  'Add Paper Property',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              AddPaperPropertyForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class AddPaperPropertyForm extends StatefulWidget {
  @override
  AddPaperPropertyFormState createState() {
    return AddPaperPropertyFormState();
  }
}

class AddPaperPropertyFormState extends State<AddPaperPropertyForm> {
  final _formKey = GlobalKey<FormState>();
  var papertype = ["Size", "Weight", "Finish"];
  var typeSelect = "Size";
  var categorytype = ["Business Card", "Flyer", "Notebook", "All Categories"];
  var categorySelect = "All Categories";

  final valueController = TextEditingController();
  final priceController = TextEditingController();
  List<String> paperCategorySnap =["All Categories"];
  var data;

  

  @override
  Widget build(BuildContext context) {

    double num = 0;
    return Form(
      key: _formKey,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("category").snapshots(),
        builder: (context, snapshot){
        if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 
        
        for(var document in snapshot.data.docs)
        {
          paperCategorySnap.add(document["name"]);
        }
        paperCategorySnap = paperCategorySnap.toSet().toList();
         return Column(children: <Widget>[
            //Paper Type
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, top: 5),
                  child: Text(
                    "Paper Type",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 8, top: 5),
                  child: DropdownButton<String>(
                    items: papertype.map(
                      (String value2) {
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Text(value2),
                        );
                      },
                    ).toList(),

                    onChanged: (String newValue2) {
                      setState(
                        () {
                          typeSelect = newValue2;
                        },
                      );
                    },
                    value: typeSelect,
                  ),
                ),
              ],
            ),

            

            //Description
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: valueController,
                decoration: InputDecoration(
                  hintText: 'Value of paper type you selected',
                  labelText: 'Value',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter paper Value';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            //Price
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: 'Enter Price',
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
            //Category
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Category Type",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 8),
                  child: DropdownButton<String>(
                    items: paperCategorySnap.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          
                        );
                      },
                    ).toList(),
                    onChanged: (String newValue) {
                      setState(
                        () {
                          categorySelect = newValue;
                        },
                      );
                    },
                    value: categorySelect,
                  ),
                ),
              ],
            ),

            // Submit Button
            RaisedButton(
              onPressed: () {
                //p.getPriceOfSize();
                //p.getPriceOfWeight();
                //p.getPriceOfFinish();
                //p.getPrice();
                if (_formKey.currentState.validate()) {
                  print('The Form is Valid');
                }
                /*
                final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
                final key = Key.fromLength(32);

                final iv = IV.fromLength(8);
                final encrypter = Encrypter(Salsa20(key));

                final encrypted = encrypter.encrypt(plainText, iv: iv);
                final decrypted = encrypter.decrypt(encrypted, iv: iv);

                print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
                print(encrypted.base64); 
                */
                if(categorySelect == "All Categories")
                {
                  for (var name in paperCategorySnap)
                  {
                    if(name != "All Categories")
                    {
                      admin.addPaperProperty(typeSelect, double.parse(priceController.text), valueController.text, name);
                    }
                  }
                }
                else
                {
                  admin.addPaperProperty(typeSelect, double.parse(priceController.text), valueController.text, categorySelect);
                }
              },
              color: Colors.yellow[700],
              child: Text(
                'Add Paper Property',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ]);
        }));
  }
  
}
