import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyDatabase extends ChangeNotifier {
  late DatabaseReference dbref;
  String? status;
  String? ageOne;
  String? ageTwo;
  String? databaseJson;

  void createdb() {
    dbref.child('Profile').set('Hamza');
  }

  void readDbOneChild() {
    dbref.child('customer1').child('age').once().then((
      DatabaseEvent databaseEvent,
    ) {
      final event = databaseEvent.snapshot;
      databaseJson = event.value.toString();
      log('read once${event.value}');
      notifyListeners();
    });
  }

  void updateValue() {
    dbref.child('hamza').update({'Car': 'kla'});
  }
}

MyDatabase myDatabase = MyDatabase();
