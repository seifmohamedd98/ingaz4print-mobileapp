import 'package:flutter/material.dart';
import 'package:ingaz/delete_paper_property.dart';
import 'package:ingaz/modify_categories.dart';
// import 'package:ingaz/main.dart';
import 'add_category_sample.dart';

class CategorySamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ingaz 4 print',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          title: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 80,
          ),
          toolbarHeight: 95,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CategoryButton("Add Category Sample"),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: CategoryButton("Delete Category Sample"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget
{
  String _name;
  CategoryButton(name)
  {
    this._name = name;
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width*0.9,
    padding: EdgeInsets.only(top: 20.0),
    child: FloatingActionButton
    (
      heroTag: _name,
      onPressed: () 
      { 
        if(_name == "Add Category Sample")
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                
                

                builder: (context) => AddCategorySample()
              )
          );
        }
        else
        {
          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeleteCategorySample()
              )
          );*/
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: Colors.yellow[700],
      child: Text
      (
        _name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    ),
  );
}


}


/*class AddSampleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCategorySample(),
            ),
          );
        },
        color: Colors.yellow[700],
        child: Text(
          'Add Catgeory Sample',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}


class DeleteSampleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DeleteCategorySample(),
          //   ),
          // );
        },
        color: Colors.yellow[700],
        child: Text(
          'Delete Catgeory Sample',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }*/