import 'package:cloud_firestore/cloud_firestore.dart';

import 'Product.dart';
class Cart
{
  //List<Product> productList;


  Future addToCart(Product p, String username) 
  {
    CollectionReference product = FirebaseFirestore.instance.collection('order_details');
    String documentID = product.doc().id;

     DocumentReference ref = FirebaseFirestore.instance.collection("order_details").doc();
        ref.set({
          'id': documentID,
          'access': username,
          'category': p.paper.getCategory().getName(),
          'quantity': p.quantity,
          'price': p.price,
          'paper_quantity': p.paperQuantity,
          'paper_price': p.paperPrice,
          'total_price': p.totalPrice,
          'paper_size': p.paper.getSize(),
          'paper_weight': p.paper.getWeight(),
          'paper_finish': p.paper.getFinish(),
          'printed_sides': p.paper.getSide(),
          'description': p.description,
          'cart_date': DateTime.now(),
          'order_date': "",
          'delivery_date': "",
          'order_status': 0,
          'approval_status': 0,
          'delivery_status': 0
        })
        .then((value) => print("Product Added to Cart"))
        .catchError((error) => print("Failed to Add Product to Cart: $error"));
  }
  
}