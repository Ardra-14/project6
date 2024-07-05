import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  //list of items for sale

  final List _shopItems = [
    //["itemName" ,"itemPrice", "imagePath" , "color"]

    ["Avocado", "180.00" , "assets/avo.jpg", Colors.white],
    ["Banana", "37.00" , "assets/bana.jpg", Colors.white],
    ["Chicken", "160.00" , "assets/chic.jpg", Colors.white],
    ["Soft Drinks", "60.00" , "assets/jui.jpg", Colors.white],
  ];

  //list of items for cart

  final List _cartItems = [ ];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //add item to cart

  void addItemsToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart

  void removeItemsFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price

 String calculateTotal(){
  double totalprice = 0;
  for(int i = 0 ; i < _cartItems.length ; i++){
    totalprice += double.parse(_cartItems[i][1]) ;
  }
  return totalprice.toStringAsFixed(2);
 }

}