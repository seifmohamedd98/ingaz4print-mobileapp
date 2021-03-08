import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ingaz/models/paper_property.dart';
//final firestoreInstance = FirebaseFirestore.instance.collection(collectionPath);

class Category
{
  //int _id;
  String _name;
  int _maxPaperQuantity;
  double _addedInitialPrice;

  Category(name, maxPaperQuantity, addedInitialPrice)
  {
    this._name = name;
    this._maxPaperQuantity = maxPaperQuantity;
    this._addedInitialPrice = addedInitialPrice;
  }
   // Getters and Setters
  /*void setId(int id)
  {
    this._id=id;
  }
  int getId()
  {
    return this._id;
  }*/

  void setName(String name)
  {
    this._name=name;
  }
  String getName()
  {
    return this._name;
  }

  void setMaxPaperQuantity(int maxPaperQuantity)
  {
    this._maxPaperQuantity=maxPaperQuantity;
  }
  int getMaxPaperQuantity()
  {
    return this._maxPaperQuantity;
  }

  void setAddedInitialPrice(double addedInitialPrice)
  {
    this._addedInitialPrice=addedInitialPrice;
  }
  double getAddedInitialPrice()
  {
    return this._addedInitialPrice;
  }

  /*Map<String, dynamic> getCategory(name)
  {
    CollectionReference fireStoreInstance = FirebaseFirestore.instance.collection("category");
    //final DocumentReference document =   FirebaseFirestore.instance.collection("category").;

     fireStoreInstance
      .where("name", isEqualTo: name)
      .snapshots()
      .listen((result) {
        result.docs.forEach((result) {
         print(result.data());
        });
      });



    /*fireStoreInstance.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        fireStoreInstance
        .where("category_name", isEqualTo: name)
        .get()
        .then((value) {
          value.docs.forEach((result) {
            print(result.data());
            return result.data();
          });
        });
      }); 
    });*/

    
    /*fireStoreInstance.snapshots().listen((snapshot) { 
      snapshot.docs.forEach((result) { 
        fireStoreInstance.where("name", isEqualTo: name)
        .get()
        .then((value) {
          return value.docs.toString();
        });

        
      });
      
    });*/

    
  }

  /*Future<dynamic> getCategory(name) async 
  {

    //final DocumentReference document =   FirebaseFirestore.instance.collection("category").;
    firestoreInstance.collection("category").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        firestoreInstance
        .collection("users")
        .doc(result.id)
        .collection("pets")
        .get()
        .then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            print(result.data());
            });
          });
        });
      });
    }*/ 
    
    */
  
}
