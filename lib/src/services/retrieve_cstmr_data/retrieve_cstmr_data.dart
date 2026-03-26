import 'dart:developer';

import 'package:drips_water/src/model/customer_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RetrieveCstmrData extends ChangeNotifier {
  List<CustomerModel> customerData = [];

  Future<void> fetchCustomer() async {
    final snapshot = await FirebaseDatabase.instance.ref('Customers/').get();
    if (!snapshot.exists) return;
    final rawData = Map<String, dynamic>.from(snapshot.value as Map);
    customerData.clear();
    rawData.forEach((key, value) {
      var customerModel = CustomerModel.fromJson(
        Map<String, dynamic>.from(value),
        key,
      );
      customerData.add(customerModel);
    });
    log('customerData: $customerData');
    notifyListeners();
  }
}
