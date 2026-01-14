import 'package:flutter/material.dart';

class CreateCstmr extends ChangeNotifier {
  static int numberOfCustomers = 0;
  static TextEditingController name = TextEditingController();
  static TextEditingController address = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController perdayCane = TextEditingController();
  static TextEditingController eachCanePrice = TextEditingController();
  static List<Map> customer = [];
  static TextEditingController _customerId = TextEditingController();

  static TextEditingController get customerId => _customerId;

  void createCustomerId() {
    String signature = 'DW417';
    if (customer.isEmpty) {
      customerId.text = signature + (customer.length + 1).toString();
    } else {
      var split = customer.last['customerId'].toString().split('DW417');
      _customerId.text =
          signature + (int.parse(split[split.length - 1]) + 1).toString();
    }
    notifyListeners();
  }

  void addCustomer() {
    customer.add({
      'name': name.text.trim(),
      'address': address.text.trim(),
      'phone': phone.text.trim(),
      'perdayCane': perdayCane.text.trim(),
      'customerId': customerId.text,
      'eachCanePrice': eachCanePrice.text.trim(),
    });
  }

  // Clearing all controller for new customer
  void clearingControllers() {
    name.clear();
    address.clear();
    phone.clear();
    perdayCane.clear();
    eachCanePrice.clear();
  }

  void disposingControllers() {
    name.dispose();
    address.dispose();
    phone.dispose();
    perdayCane.dispose();
    customerId.dispose();
    eachCanePrice.dispose();
  }
}
