import 'package:flutter/material.dart';
// import 'package:ingaz/main.dart';
import 'business_card.dart';
import 'flyer.dart';
import 'notebook.dart';

class Categories extends StatelessWidget {
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
                child: BussinesButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: FlyerButton(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: NoteButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BussinesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BussinessCard(),
            ),
          );
        },
        color: Colors.yellow[700],
        child: Text(
          'Business Card',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class FlyerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Flyer(),
            ),
          );
        },
        color: Colors.yellow[700],
        child: Text(
          'Flyer',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notebook(),
            ),
          );
        },
        color: Colors.yellow[700],
        child: Text(
          'Notebook',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
