import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
        body: SafeArea(
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
  var papertype = ["Paper Size", "Paper Weight", "Paper Finish"];
  var typeselect = "Paper Size";
  var categorytype = ["Business Card", "Flyer", "Notebook", "All Categories"];
  var categoryselect = "All Categories";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
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
                      typeselect = newValue2;
                    },
                  );
                },
                // value: typeselect,
              ),
            ),
          ],
        ),

        //Description
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: TextFormField(
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
            'Add Paper Property',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
