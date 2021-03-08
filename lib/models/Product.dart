import 'dart:io';

import 'paper.dart';

class Product
{
  int id;

  int quantity;
  double price;

  int paperQuantity;
  double paperPrice;

  double totalPrice;

  String name;
  Paper paper;
  String description;
  File design;

  DateTime addToCartDate;
  DateTime orderDate;
  DateTime deliveryDate;

  bool orderStatus;
  bool approvalStatus;
  bool deliveryStatus;

  
}