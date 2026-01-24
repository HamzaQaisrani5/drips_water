import 'dart:developer';
// import 'dart:math';

import 'package:drips_water/logic/create_cstmr.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyDatabase extends ChangeNotifier {
  // method that store every customer data into dbRef.child('Customer')
  final database = FirebaseDatabase.instance.ref();
  void addToDatabase(BuildContext context, int index) async {
    var infoTitle =
        '${context.read<CreateCstmr>().customer[index]['customerId']}';
    try {
      await database
          .child('Customers/')
          .child(infoTitle)
          .set(context.read<CreateCstmr>().customer[index]);
      print('Data set successfully');
    } catch (e) {
      print('Exception caught: $e');
    }
    notifyListeners();
  }

  /*String getRandomDrinks() {
    final drinkList = [
      'Latte',
      'Cuppacino',
      'Machiatto',
      'Cortado',
      'Mocha',
      'Drip Coffee',
      'Cold Brew',
    ];
    return drinkList[Random().nextInt(drinkList.length)];
  }

  String getRandomName() {
    final customerName = [
      'Sam',
      'Arthur',
      'Jessica',
      'Todd',
      'Morgan',
      'Sumit',
      'David',
    ];
    return customerName[Random().nextInt(customerName.length)];
  }*/

  String _displayNewDescription = 'not called';
  String get displayNewDescription => _displayNewDescription;
  void activateListeners() {
    log('Method is Calling: ');
    database.child('Customers').onValue.listen((event) {
      _displayNewDescription = event.snapshot.value.toString();
      log('_displayNewDescription: $_displayNewDescription');
      notifyListeners();
    });
  }
}

// MyDatabase myDatabase = MyDatabase();
