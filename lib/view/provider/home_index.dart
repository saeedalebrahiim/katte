import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:delivery/routs/routs.dart';
import 'package:flutter/material.dart';

class HomeIndexProvider extends ChangeNotifier {
  static List<CategoryDto> allCatgeroies = [];
  static List<ProductDto> allProducts = [];

  void setCategories(List<CategoryDto> newList) {
    allCatgeroies = newList;
    notifyListeners();
  }

  void setProducts(List<ProductDto> newList) {
    allProducts = newList;
    notifyListeners();
  }
}
