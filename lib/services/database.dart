import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ingaz/models/user.dart';
import 'package:ingaz/models/client.dart';

class DatabaseManager {
  final CollectionReference database =
      FirebaseFirestore.instance.collection('users');

  // final String uid;
  // DatabaseManager({this.uid});

  addUser(Client user) {
    return database.add({
      'E-mail': user.email,
      'Username': user.username,
      'Password': user.password,
      "First Name": user.fname,
      "Last Name": user.lname,
      "Address": user.address,
      "Mobile Number": user.mobile,
      "Access": user.access,
      'User ID': user.uId,
    });
  }

  // Future updateUser(User data) async {
  //   return await database.doc(data.uId).set({
  //     'User ID': data.uId,
  //   });
  // }
}
