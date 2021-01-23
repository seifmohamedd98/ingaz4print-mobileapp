import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
        body: SafeArea(
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
  var categorytype = ["Business Card", "Flyer", "Notebook"];
  var categoryselect = "Business Card";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Hena hayt7t el image upload',
              labelText: 'Image Upload',
            ),
          ),
        ),
        //Description
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: TextFormField(
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
                items: categorytype.map(
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
        RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              print('The Form is Valid');
            }
          },
          color: Colors.yellow[700],
          child: Text(
            'Add Category Sample',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
