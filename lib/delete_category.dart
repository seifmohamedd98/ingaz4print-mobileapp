import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/admin.dart';
import 'models/category.dart';
import 'models/paper.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//Initializing admin
Admin admin = new Admin();

class DeleteCategory extends StatelessWidget {
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
                  'Delete Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              DeleteCategoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class DeleteCategoryForm extends StatefulWidget {
  @override
  DeleteCategoryFormState createState() {
    return DeleteCategoryFormState();
  }
}

class DeleteCategoryFormState extends State<DeleteCategoryForm> {
  final _formKey = GlobalKey<FormState>();

  final valueController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final initalAddedPriceController = TextEditingController();
    final maxPaperQuantity = TextEditingController();

    double num = 0;
    return Form(
        key: _formKey,
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("category").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Text("Loading Data.. Please wait..");
              List<Map<String, String>> listOfRows = [];
              for (var document in snapshot.data.docs) {
                listOfRows.add({
                  "name": document["name"],
                  "added_inital_price": document["added_inital_price"],
                  "max_paper_quantity": document["max_paper_quantity"]
                });
              }

              return SingleChildScrollView(
                  child: Column(children: [
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text('Name'),
                            ),
                            DataColumn(
                              label: Text('Added Initial Price'),
                            ),
                            DataColumn(
                              label: Text('Max Paper Quantity'),
                            ),
                            DataColumn(
                              label: Text('Action'),
                            ),
                          ],
                          rows: listOfRows
                              .map(
                                (e) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Container(
                                        width: 50, child: Text(e["name"]))),
                                    DataCell(Text(e["added_inital_price"])),
                                    DataCell(Text(e["max_paper_quantity"])),
                                    DataCell(DeleteButton(e["name"])),
                                  ],
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ),
              ]));
            }));
  }
}

class DeleteButton extends StatelessWidget {
  String _id;
  DeleteButton(String id) {
    this._id = id;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        onPressed: () {
          admin.deleteCategory(_id);
        },
        color: Colors.yellow[700],
        child: Text(
          'Delete',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
