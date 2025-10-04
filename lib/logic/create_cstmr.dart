import 'package:flutter/material.dart';

class CreateCstmr {
  static int numberOfCustomers = 0;
  static TextEditingController name = TextEditingController();
  static TextEditingController address = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController perdayCane = TextEditingController();
  static TextEditingController eachCanePrice = TextEditingController();
  static List<Map> customer = [];
  static TextEditingController customerId = TextEditingController();

   void createCustomerId() {
    String signature = 'DW417';
    if (customer.isEmpty) {
      customerId.text = signature + (customer.length + 1).toString();
    } else {
      var split = customer.last['customerId'].toString().split('DW417');
      customerId.text =
          signature + (int.parse(split[split.length - 1]) + 1).toString();
    }
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