import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class Login extends StatelessWidget {
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
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Username'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter username';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter password';
              } else {
                return null;
              }
            },
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
            'Login',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
