import 'dart:async';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class MyDatabase extends ChangeNotifier {
  final database = FirebaseDatabase.instance.ref();
  // method that store every customer data into dbRef.child('Customer')
  Future<void> addToDatabase({
    required BuildContext context,
    int? index,
    required String? name,
    required String? address,
    required String? phoneNo,
    required String? perDayCane,
    required String? customerId,
    required String? eachCanePrice,
  }) async {
    
    var customerInfo = {
      'name': name,
      'address': address,
      'phoneNo': phoneNo,
      'perDayCane': perDayCane,
      'customerId': customerId,
      'eachCanePrice': eachCanePrice,
    };
    var infoTitle = customerInfo['customerId'];
    if (infoTitle != null) {
      try {
        await database
            .child('Customers/')
            .child(infoTitle)
            .set(customerInfo /*context.read<AddCustomerDialog>().customer[index]*/);
        log('*** Data Stored to dB ***');
      } catch (e) {
        log('Exception caught when storing data to dB: $e');
      }
    }
    notifyListeners();
  }
}