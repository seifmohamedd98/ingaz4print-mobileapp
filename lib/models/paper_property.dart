import 'category.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class PaperProperty
{
  String _id;
  String _name;
  String _value;
  double _price;
  Category _category;

  // Constructors
  Future<PaperProperty> getPaperProperty(String type, String value, String category) async // returns Paper Property object from database
  {
    CollectionReference fireStoreInstance = FirebaseFirestore.instance.collection("category");
    fireStoreInstance
      .where("type", isEqualTo: type)
      .where("value", isEqualTo: value)
      .where("category", isEqualTo: category)
      .snapshots()
      .listen((result) {
        result.docs.forEach((result) {
         print(result.data());
        });
      });
  }
  

  // Functions

  // Getters and Setters

  void setName(String name)
  {
    this._name=name;
  }
  String getName()
  {
    return this._name;
  }

  void setValue(String value)
  {
    this._value=value;
  }
  String getValue()
  {
    return this._value;
  }

  void setPrice(double price)
  {
    this._price=price;
  }
  double getPrice()
  {
    return this._price;
  }

  void setCategory(Category category)
  {
    this._category=category;
  }
  Category getCategory()
  {
    return this._category;
  }
}