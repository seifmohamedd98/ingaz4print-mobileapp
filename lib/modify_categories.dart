import 'package:flutter/material.dart';
// import 'package:ingaz/main.dart';

class ModifyCategories extends StatelessWidget {
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
                child: AddCategoryButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DeleteCategoryButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AddCategory(),
          //   ),
          // );
        },
        color: Colors.yellow[700],
        child: Text(
          'Add Category',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

class DeleteCategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DeleteCategory(),
          //   ),
          // );
        },
        color: Colors.yellow[700],
        child: Text(
          'Delete Category',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
