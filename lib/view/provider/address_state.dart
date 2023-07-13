import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:flutter/material.dart';

class AddressIndexProvider extends ChangeNotifier {
  static List<AddressDto> allAddresses = [];
  void setAddresses(List<AddressDto> newList) {
    allAddresses = newList;
    notifyListeners();
  }
}
