import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  // For Image Picker   
import 'package:ingaz/categories.dart';
import 'models/client.dart'; 
import 'samples.dart';


Client client = new Client();

class ImageInputAdapter {
  /// Initialize from either a URL or a file, but not both.
  ImageInputAdapter({
    this.file,
    this.url
  }) : assert(file != null || url != null), assert(file != null && url == null), assert(file == null && url != null);

  /// An image file
  final File file;
  /// A direct link to the remote image
  final String url;

  /// Render the image from a file or from a remote source.
  Widget widgetize() {
    if (file != null) {
      return Image.file(file);
    } else {
      return FadeInImage(
        image: NetworkImage(url),
        placeholder: AssetImage("assets/images/placeholder.png"),
        fit: BoxFit.contain,
      );
    }
  }
}

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class CategoryMaker extends StatelessWidget {
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
                  category + ' Maker',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              BussinesCardForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class BusinesscardTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        category+' :-',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
    );
  }
}

// Create a Form widget.
class BussinesCardForm extends StatefulWidget {
  @override
  BussinesCardFormState createState() {
    return BussinesCardFormState();
  }
}

class BussinesCardFormState extends State<BussinesCardForm> {
  final _formKey = GlobalKey<FormState>();
  var paperSizeSnap = ["Standard (50.8 x 88.9 mm)"];
  var sizeSelect = "Standard (50.8 x 88.9 mm)";

  var paperWeightSnap = ["135gsm"];
  var weightSelect = "135gsm";

  var paperFinishSnap = ["Uncoated"];
  var finishSelect = "Uncoated";

  var paperSides = ["Single Sided", "Double Sided"];
  var sidesSelect = "Single Sided";

  File _image;
  final picker = ImagePicker();

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
        stream: FirebaseFirestore.instance.collection("paper_property").where("category", isEqualTo: category).snapshots(),
        builder: (context, snapshot)
        {
          if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 
          for(var document in snapshot.data.docs)
          {
            if(document["type"] == "Finish")
            {
              paperFinishSnap.add(document["value"]);
            }
            if(document["type"] == "Weight")
            {
              paperWeightSnap.add(document["value"]);
            }
            if(document["type"] == "Size")
            {
              paperSizeSnap.add(document["value"]);
            }
          }
          paperFinishSnap = paperFinishSnap.toSet().toList();
          paperWeightSnap = paperWeightSnap.toSet().toList();
          paperSizeSnap = paperSizeSnap.toSet().toList();

          return Column(children: <Widget>[
            //Quantity
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Quantity of product',
                  labelText: 'Enter Quantity',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter quantity';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            //Paper quantity
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'If 1 product contain more than 1 paper else make it 1',
                  labelText: 'Enter Paper quantity',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Paper quantity';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            //Paper Size
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Paper Size",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 55, right: 8),
                  child: DropdownButton<String>(
                    items: paperSizeSnap.map(
                      (String valueSize) {
                        return DropdownMenuItem<String>(
                          value: valueSize,
                          child: Text(valueSize),
                        );
                      },
                    ).toList(),
                    onChanged: (String newValueSize) {
                      setState(
                        () {
                          sizeSelect = newValueSize;
                        },
                      );
                    },
                    value: sizeSelect,
                  ),
                ),
              ],
            ),
            //Paper Finish
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Paper Finish",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 8),
                  child: DropdownButton<String>(
                    items: paperFinishSnap.map(
                      (String valueFinish) {
                        return DropdownMenuItem<String>(
                          value: valueFinish,
                          child: Text(valueFinish),
                        );
                      },
                    ).toList(),

                    onChanged: (String newValueFinish) {
                      setState(
                        () {
                          finishSelect = newValueFinish;
                        },
                      );
                    },
                    value: finishSelect,
                  ),
                ),
              ],
            ),
            
            //Printed Sides
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Printed Sides",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 8),
                  child: DropdownButton<String>(
                    items: paperSides.map(
                      (String valueSides) {
                        return DropdownMenuItem<String>(
                          value: valueSides,
                          child: Text(valueSides),
                        );
                      },
                    ).toList(),

                    onChanged: (String newValueSides) {
                      setState(
                        () {
                          sidesSelect = newValueSides;
                        },
                      );
                    },
                    value: sidesSelect,
                  ),
                ),
              ],
            ),
            //Paper Weight
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Paper Weight",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 8),
                  child: DropdownButton<String>(
                    items: paperWeightSnap.map(
                      (String valueWeight) {
                        return DropdownMenuItem<String>(
                          value: valueWeight,
                          child: Text(valueWeight),
                        );
                      },
                    ).toList(),

                    onChanged: (String newValueWeight) {
                      setState(
                        () {
                          weightSelect = newValueWeight;
                        },
                      );
                    },
                    value: weightSelect,
                  ),
                ),
              ],
            ),

            _image == null ? Text('No image selected.') : Image.file(_image),

            FloatingActionButton(
              onPressed: getImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),

            //Description
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Optional',
                  labelText: 'Description (Optional)',
                ),
              ),
            ),


            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('The Form is Valid');
                }
              },
              color: Colors.yellow[700],
              child: Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ]);}
    ));
  }
}

