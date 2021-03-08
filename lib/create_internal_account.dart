import 'package:flutter/material.dart';
import 'package:ingaz/models/client.dart';
import 'package:ingaz/models/internal_user.dart';
import 'package:ingaz/services/auth.dart';
import 'package:ingaz/services/database.dart';
import 'models/user.dart';

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
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CreateAccountForm(),
            ],
          ),
        )),
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
  String _email, _password, _username, _fname, _lname, _address, _mobile;
  final _auth = Auth();
  final database = DatabaseManager();

//DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Enter E-mail'),
              onChanged: (value) {
                _email = value;
              },
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
              onChanged: (value) {
                _username = value;
              },
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
              onChanged: (value) {
                _password = value;
              },
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
              onChanged: (value) {
                _fname = value;
              },
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
              onChanged: (value) {
                _lname = value;
              },
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
              onChanged: (value) {
                _address = value;
              },
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
              onChanged: (value) {
                _mobile = value;
              },
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
                padding: EdgeInsets.only(left: 15),
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
                        .then((date) {
                      setState(() {});
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Builder(
                builder: (context) => RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      try {
                        print('The Form is Valid');
                        print(_email);
                        print(_password);
                        final authResult =
                            await _auth.SignUp(_email, _password);
                        print(authResult.user.uid);
                        database.addUser(Client(
                          email: _email,
                          username: _username,
                          password: _password,
                          fname: _fname,
                          lname: _lname,
                          address: _address,
                          mobile: _mobile,
                          access: "internal",
                          uId: authResult.user.uid,
                        ));
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(e.message),
                        ));
                      }
                    }
                  },
                  color: Colors.yellow[700],
                  child: Text(
                    'Create Internal Account',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
