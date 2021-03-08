import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:ingaz/add_paper_property.dart';

import 'models/admin.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
Admin admin = new Admin();

class AddCategorySample extends StatelessWidget {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Add Category Sample',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              AddCategorySampleForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class AddCategorySampleForm extends StatefulWidget {
  @override
  AddCategorySampleFormState createState() {
    return AddCategorySampleFormState();
  }
}

class AddCategorySampleFormState extends State<AddCategorySampleForm> {
  final _formKey = GlobalKey<FormState>();
  String categoryselect = "Notebook";

  final descriptionValue = TextEditingController();

  File _image;
  final picker = ImagePicker();

  List<String> categories =[];

  Future getImage() async 
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("category").snapshots(),
        builder: (context, snapshot){
        if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 

        for(var document in snapshot.data.docs)
        {
          categories.add(document["name"]);
        }
        categories = categories.toSet().toList();
        //categoryselect = categories[0];

        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            //Description
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                controller: descriptionValue,
                decoration: InputDecoration(
                  hintText: 'Enter Image Description',
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter paper description';
                  } else {
                    return null;
                  }
                },
              ),
            ),
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
                    items: categories.map(
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
                          categoryselect = newValue;
                        },
                      );
                    },
                    value: categoryselect,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            _image == null ? Text('No image selected.') : Image.file(_image),

            FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo,color: Colors.black,),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              backgroundColor: Colors.yellow[800],
              
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: FloatingActionButton
              (
                heroTag: "Submit Add Category Sample",
                onPressed: () 
                {
                  admin.addCategorySample(descriptionValue.text, _image, categoryselect);
                  if (_formKey.currentState.validate()) 
                  {
                    print('The Form is Valid');
                  }
                  
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                backgroundColor: Colors.yellow[700],
                child: Text
                (
                  'Add Category Sample',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]
          );
        }
      )
    );
  }
}
