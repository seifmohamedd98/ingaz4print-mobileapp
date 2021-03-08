import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/admin.dart';
import 'models/category.dart';
import 'models/paper.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//Initializing admin
Admin admin = new Admin();

class DeletePaperProperty extends StatelessWidget {
  
  
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
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Delete Paper Property',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
              DeletePaperPropertyForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class DeletePaperPropertyForm extends StatefulWidget {
  @override
  DeletePaperPropertyFormState createState() {
    return DeletePaperPropertyFormState();
  }
}

class DeletePaperPropertyFormState extends State<DeletePaperPropertyForm> 
{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double num = 0;
    return Form
    (
      key: _formKey,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("paper_property").snapshots(),
        builder: (context, snapshot){
        if(!snapshot.hasData) return Text("Loading Data.. Please wait.."); 
        List<Map<String, String>> listOfRows = [];
         for(var document in snapshot.data.docs)
          {
            listOfRows.add({"type": document["type"], "value": document["value"], "category": document["category"], "price": document["price"].toString(), "id":document["id"]});
          }

        return SingleChildScrollView
        (
          child: Column
          (
            children: 
            [

              Container
              (  
                
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      
                      
                      columns: <DataColumn>[
                        
                        DataColumn(
                          label: Text('Type'),
                        ),
                        DataColumn(
                          label: Text('Value'),
                        ),
                        DataColumn(
                          label: Text('Price'),
                        ),
                        DataColumn(
                          label: Text('Category'),
                        ),
                        DataColumn(
                          label: Text('Action'),
                        ),
                      ],
                      rows: listOfRows.map((e) =>
                          DataRow
                          (
                            cells: <DataCell>
                            [
                              DataCell( Container ( width: 50,child: Text(e["type"]))),
                              DataCell(Text(e["value"])),
                              DataCell(Text(e["price"])),
                              DataCell(Text(e["category"])),
                              DataCell(DeleteButton(e["id"])),
                            ],
                          ),
                      ).toList()
                        
                    ),
                  ),
                ),
              ),  
            ]
          )

        );


        

      })

    );

  }
  
}

class DeleteButton extends StatelessWidget {

  String _id;
  DeleteButton(String id)
  {
    this._id=id;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        onPressed: () {
          admin.deletePaperProperty(_id);
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
