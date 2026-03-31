import 'dart:developer';

import 'package:drips_water/src/model/customer_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RetrieveCstmrData extends ChangeNotifier {
  List<CustomerModel> customerData = [];

  Future<void> fetchCustomer() async {
    //  fbrtdb instance
    customerData.clear();
    final dbCustomersRaw =
        await FirebaseDatabase.instance.ref('Customers/').get();
    final customers = dbCustomersRaw.value as Map?;
    log('Customers: $customers');
    for (final eachInfo in customers!.entries) {
      final eachValue = Map<String, dynamic>.from(eachInfo.value as Map);
      customerData.add(CustomerModel.fromJson(eachValue));
    }
    log('Customers length: ${customerData.length}');
    notifyListeners();
  }
}
