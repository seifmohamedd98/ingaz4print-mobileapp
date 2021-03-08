import 'package:cloud_firestore/cloud_firestore.dart';

import 'category.dart';

class Paper
{
  String _size;
  String _finish;
  String _weight;
  String _side;
  Category _category;
  

  // Constructors
  Paper(size, finish, weight, category, side)
  {
    
    this._size=size;
    this._finish=finish;
    this._side=side;
    this._weight=weight;
    this._category=category;
  }

  // Functions
  double getPriceOfWeight()
  {
    CollectionReference fireStoreInstance = FirebaseFirestore.instance.collection("paper_property");
    fireStoreInstance
      .where("value", isEqualTo: this._weight)
      .where("category", isEqualTo: _category.getName())
      .snapshots()
      .listen((result) {
        result.docs.forEach((result) {
          print("Weight Price: "+result.data()["price"].toString());
         //return result.data()["price"];
        });
      });
  }

    double getPriceOfSize() 
    {
    CollectionReference fireStoreInstance = FirebaseFirestore.instance.collection("paper_property");
    fireStoreInstance
      .where("value", isEqualTo: this._size)
      .where("category", isEqualTo: _category.getName())
      .snapshots()
      .listen((result) {
        result.docs.forEach((result) {

          print("Size Price: " + result.data()["price"].toString());
          //return result.data()["price"];
        });
      });
    }

    double getPriceOfFinish()
    {
      if(this._finish == "")
      {
        print("Finish Price: " + 0.0.toString());
        return 0.0;
      }
      CollectionReference fireStoreInstance = FirebaseFirestore.instance.collection("paper_property");
      fireStoreInstance
        .where("value", isEqualTo: this._finish)
        .where("category", isEqualTo: _category.getName())
        .snapshots()
        .listen((result) {
          result.docs.forEach((result) 
          {
            
            if(result.exists)
            {
              print("Finish Price: " + result.data()["price"].toString());
              return result.data()["price"];
            }
            else
            {
              print("Finish Price: " + 0.0.toString());
              return 0.0;
            }
          });
        });
    }


  double getPrice() // Gets total price of paper
  {
    double finishPrice = 0.0;
    double sizePrice = 0.0;
    double weightPrice = 0.0;
    double price = 0.0;

    finishPrice = getPriceOfFinish();
    sizePrice = getPriceOfSize();
    //weightPrice = getPriceOfWeight();

    if(this._side == "Single Sided")
    {
      price = (finishPrice + sizePrice + weightPrice);
      print("Sum Price: "+price.toString());
      return price;
    }
    else
    {
      price = 2.0 * (finishPrice + sizePrice + weightPrice);
      print("Sum Price: "+price.toString());
      return price;
    }
  }

  // Getters and Setters

  void setSize(String size)
  {
    this._size=size;
  }
  String getSize()
  {
    return this._size;
  }

  void setFinish(String finish)
  {
    this._finish=finish;
  }
  String getFinish()
  {
    return this._finish;
  }


  void setSide(String side)
  {
    this._side=side;
  }
  String getSide()
  {
    return this._side;
  }

  void setWeight(String weight)
  {
    this._weight=weight;
  }
  String getWeight()
  {
    return this._weight;
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

