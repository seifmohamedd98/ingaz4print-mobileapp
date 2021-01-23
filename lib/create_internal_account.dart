import 'package:flutter/material.dart';

/*void main() {
  runApp(SignUp());
}*/

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class CreateAccount extends StatelessWidget {
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
                padding: EdgeInsets.only(top: 5),
                // child: Text(
                //   'Create Account',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 35,
                //   ),
                // ),
              ),
              CreateAccountForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class CreateAccountForm extends StatefulWidget {
  @override
  CreateAccountFormState createState() {
    return CreateAccountFormState();
  }
}

enum Gender { male, female }

class CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.male;
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter E-mail',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter E-mail';
                } else {
                  return null;
                }
              },
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
          // Padding(
          //   padding: EdgeInsets.only(left: 8, right: 8),
          //   child: TextFormField(
          //     decoration: InputDecoration(hintText: 'Confirm Password'),
          //     obscureText: true,
          //     validator: (value) {
          //       if (value.isEmpty) {
          //         return 'Please Confirm password';
          //       } else {
          //         return null;
          //       }
          //     },
          //   ),
          // ),
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
            padding: EdgeInsets.only(left: 8, right: 8),
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
          ListTile(
            title: Text('Male'),
            leading: Radio(
              value: Gender.male,
              groupValue: _gender,
              onChanged: (var value) {
                setState(
                  () {
                    _gender = value;
                  },
                );
              },
            ),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
              value: Gender.female,
              groupValue: _gender,
              onChanged: (var value) {
                setState(
                  () {
                    _gender = value;
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 5),
                child: RaisedButton(
                  child: Text(
                    'Birthday',
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.yellow[700],
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then(
                      (date) {
                        setState(
                          () {
                            _dateTime = date;
                          },
                        );
                      },
                    );
                  },
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
              'Create Internal Account',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
