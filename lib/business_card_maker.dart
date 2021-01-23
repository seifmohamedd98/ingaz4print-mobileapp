import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class BusinessCardMaker extends StatelessWidget {
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
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Business Card Maker',
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
        'Business Card :-',
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
  var papersize = ["Standard (50.8 x 88.9 mm)", "Small (40.8 x 66.3 mm)"];
  var sizeselect = "Standard (50.8 x 88.9 mm)";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
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
                items: papersize.map(
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
                      sizeselect = newValue;
                    },
                  );
                },
                value: sizeselect,
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
                items: papersize.map(
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
                      sizeselect = newValue;
                    },
                  );
                },
                // value: dropdownValue,
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
                items: papersize.map(
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
                      sizeselect = newValue;
                    },
                  );
                },
                // value: dropdownValue,
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
                items: papersize.map(
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
                      sizeselect = newValue;
                    },
                  );
                },
                // value: dropdownValue,
              ),
            ),
          ],
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
      ]),
    );
  }
}
