import 'dart:developer';

import 'package:drips_water/logic/create_cstmr.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyDatabase extends ChangeNotifier {
  final database = FirebaseDatabase.instance.ref();
  void addToDatabase(BuildContext context, int index) async {
    var infoTitle =
        '${context.read<CreateCstmr>().customer[index]['customerId']}';
    try {
      await database
          .child('Customers/')
          .child(infoTitle)
          .set(context.read<CreateCstmr>().customer[index]);
      log('Data set successfully');
    } catch (e) {
      log('Exception caught: $e');
    }
    notifyListeners();
  }
}
