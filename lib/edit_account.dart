import 'package:flutter/material.dart';

/*void main() {
  runApp(EditAccount());
}*/

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EditAccount extends StatelessWidget {
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
                  'Edit Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              EditAccountForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class EditAccountForm extends StatefulWidget {
  @override
  EditAccountFormState createState() {
    return EditAccountFormState();
  }
}

class EditAccountFormState extends State<EditAccountForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Ex: 3',
              labelText: 'Your ID (*You cannot edit your id*)',
            ),
            readOnly: true,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
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
          padding: EdgeInsets.only(left: 8, right: 8),
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
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Confirm Password'),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Confirm password';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'First Name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter First Name';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Last Name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Last Name';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Address'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Address';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 15),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Mobile Number'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Mobile Number';
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
            'Edit Account',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
