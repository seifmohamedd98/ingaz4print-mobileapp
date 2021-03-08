import 'package:ingaz/models/cart.dart';
import 'package:ingaz/models/user.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Client extends User
{
  String address;
  String fname;
  String lname;
  Cart cart;

  Client({email, username, password, mobile, access, uId, fname, lname, address}) : super(email: email, username: username, password: password, mobile: mobile, access: access, uId: uId)
  {
    this.fname=fname;
    this.address=address;
    this.lname=lname;
    
  }

  //Functions
  Future<void> addPaperProperty(type, price, value, category) 
  {
    CollectionReference paperProperty = FirebaseFirestore.instance.collection('paper_property');
    return paperProperty
        .add({
          'type': type,
          'price': price,
          'value': value,
          'category': category,
        })
        .then((value) => print("Paper Property Added"))
        .catchError((error) => print("Failed to add Paper Property: $error"));
  }
}