import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:ingaz/drawer.dart';
import 'package:ingaz/draweradmin.dart';
import 'package:ingaz/drawerclient.dart';
import 'package:ingaz/services/auth.dart';
import 'drawerinternal.dart';
import 'main.dart';

String currentUser;
String email = null;
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

CollectionReference users = FirebaseFirestore.instance.collection('users');
var fountType;

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = Auth();

  Map userData;
  void onSaved() async {
    users
        .where('E-mail', isEqualTo: _emailController.text)
        .snapshots()
        .listen((snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        userData = {
          //'userID': doc.data(),
          'Access': doc.data()['Access'],
          'Address': doc.data()['Address'],
          'E-mail': doc.data()['E-mail'],
          'First Name': doc.data()['First Name'],
          'Last Name': doc.data()['Last Name'],
          'Mobile Number': doc.data()['Mobile Number'],
          'Password': doc.data()['Password'],
          'User ID': doc.data()['User ID'],
          'Username': doc.data()['Username'],
        };
        fountType = doc.data()['Access'];
      });
    });
    if (_formKey.currentState.validate()) {
      print('The Form is Valid');
      try {
        _formKey.currentState.save();

        //_auth.SignIn(_emailController.text, _passwordController.text);
        print("geh abl el await");

        print("ba3d el await");
        print(_emailController.text);
        if (fountType == "admin") {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => HeaderDrawerAdmin()));
          setState(() {
            currentUser = "admin";
          });
          print("DrawerAdmin");
          _auth.SignIn(_emailController.text, _passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        }
        // If condition internal
        if (fountType == "internal") {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (_) => HeaderDrawerInternal()));
          setState(() {
            currentUser = "internal";
          });
          print("DrawerInternal");
          _auth.SignIn(_emailController.text, _passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        }
        if (fountType == "client") {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => HeaderDrawerClient()));
          setState(() {
            currentUser = "client";
          });
          _auth.SignIn(_emailController.text, _passwordController.text);
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        }

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => HeaderDrawerInternal()));
      } catch (e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'E-mail'),
              onChanged: (_email) {
                _email = _email;
                // email = _emailController.text;
              },
              validator: (_email) {
                if (_email.isEmpty) {
                  return 'Please enter E-mail';
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              onChanged: (_password) {
                _password = _password;
              },
              validator: (_password) {
                if (_password.isEmpty) {
                  return 'Please enter password';
                } else {
                  return null;
                }
              },
            ),
          ),
          Builder(
            builder: (context) => RaisedButton(
              onPressed: () async {
                onSaved();
              },
              color: Colors.yellow[700],
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // ignore: dead_code
        ]));
  }
}
// users.snapshots();
// (context, snapshot) {
//   if (snapshot.hasData) {
//     snapshot.data.document.map((document) {
//       if (_emailController.text == document['E-mail'] &&
//           document['Access'] == 'client') {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (_) => HeaderDrawerClient()));
//       }
//       if (_emailController.text == document['E-mail'] &&
//           document['Access'] == 'admin') {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (_) => HeaderDrawerAdmin()));
//       }
//       if (_emailController.text == document['E-mail'] &&
//           document['Access'] == 'internal') {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (_) => HeaderDrawerInternal()));
//       }
//     });
//   }
// };
