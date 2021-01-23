import 'package:flutter/material.dart';
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
                child: AddSampleButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: EditSampleButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DeleteSampleButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSampleButton extends StatelessWidget {
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

class EditSampleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EditCategorySample(),
          //   ),
          // );
        },
        color: Colors.yellow[700],
        child: Text(
          'Edit Catgeory Sample',
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
  }
}
