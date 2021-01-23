import 'dart:ui';
import "signup.dart";
import 'main.dart';
import 'package:flutter/material.dart';
import 'business_card.dart';
/*void main() {
  runApp(Login());
}*/

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class Cart extends StatelessWidget {
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
        body: Mycart(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150,
                child: DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Admin 1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text(
                            "Role: Admin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.account_box,
                            size: 70,
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home Page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'Signup',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BussinessCard(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mycart extends StatefulWidget {
  @override
  _Mycartstate createState() => _Mycartstate();
}

class _Mycartstate extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    'Your Cart :-',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(width: 3.0, color: Colors.amber),
                    columnWidths: {
                      0: FractionColumnWidth(.4),
                      1: FractionColumnWidth(.3),
                      2: FractionColumnWidth(.5)
                    },
                    children: [
                      TableRow(children: [
                        Text(
                          "Design",
                          textScaleFactor: 1.8,
                        ),
                        Text("Details", textScaleFactor: 1.8),
                        Text("Description", textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Text("Flyer", textScaleFactor: 1.5),
                        Text("order ID: 85", textScaleFactor: 1.5),
                        Text("I want it", textScaleFactor: 1.5),
                      ]),
                      TableRow(children: [
                        Image.asset(
                          'images/flyer5.jpg',
                          fit: BoxFit.contain,
                          height: 180,
                        ),
                        Text("order ID: 89", textScaleFactor: 1.5),
                        Text("reserve it", textScaleFactor: 1.5),
                      ]),
                    ],
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsetsDirectional.only(start: 150, end: 150),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  color: Colors.yellow[700],
                  child: Text('ORDER NOW'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
