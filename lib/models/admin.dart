import 'dart:io';
import 'package:ingaz/models/user.dart';
import 'package:path/path.dart';
import 'user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:path_provider/path_provider.dart';

class Admin extends User {
  Admin({email, username, password, mobile, access, uId})
      : super(
            email: email,
            username: username,
            password: password,
            mobile: mobile,
            access: access,
            uId: uId);

  //Functions
  Future<void> addPaperProperty(type, price, value, category) {
    DocumentReference ref =
        FirebaseFirestore.instance.collection("paper_property").doc();
    ref.set({
      "id": ref.id,
      'type': type,
      'price': price,
      'value': value,
      'category': category,
    });
  }

  Future<void> deletePaperProperty(String id) {
    FirebaseFirestore.instance.collection("paper_property").doc(id).delete();
  }

  Future<void> addCategorySample(description, image, category) async {
    try {
      //Directory directory = await getApplicationDocumentsDirectory();
      //print(directory.path);
      print(image.path);

      String imageName = basename(image.path);
      print(imageName);
      final File newImage = await image.copy(image.path);
      DocumentReference ref =
          FirebaseFirestore.instance.collection("category_samples").doc();
      ref.set({
        'id': ref.id,
        'description': description,
        'image': image.path,
        'category': category,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addCategory(name, addedInitialPrice, maxPaperQuantity) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection("category").doc();
    ref.set({
      'name': name,
      'added_initial_price': addedInitialPrice,
      'max_paper_quantity': maxPaperQuantity,
    });
  }

  Future<void> deleteCategory(name) async {}
}
