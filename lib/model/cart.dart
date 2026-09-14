import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:mavazi/model/cart_item.dart';
import 'package:mavazi/model/product.dart';


class CartModel extends ChangeNotifier{
  final List<CartItem>_items=[];

UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);
double getTotalCost(){
  double totalCost = 0;
  for (var item in _items){
    totalCost += item.itemTotal;
  }
  return totalCost;
}
CartItem? findITem(Product product){
  for (var item in items){
    if(item.product.name == product.name){
      return item;
    }
  }
  return null;

}
void add(Product product){
  var existingItem = findITem(product);
  if(existingItem != null){
    existingItem.quantity++;
  }else{

    _items.add(CartItem(product: product));
  }
   notifyListeners();
}


void remove(Product product){
    _items.removeWhere((item )=>item.product.name == product.name);
    notifyListeners();
  }

  void incrementQuantity(Product product){
    var existingItem = findITem(product);
    if(existingItem != null){
      existingItem.quantity++;

    }
      notifyListeners();
  }
  void decrementQuantity(Product product){
    var existingItem = findITem(product);
    if(existingItem != null && existingItem.quantity > 1){
      existingItem.quantity--;
    }else{
      remove(product);
    }
    notifyListeners();
  }
}

