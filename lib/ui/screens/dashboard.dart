// import 'dart:developer';
import 'dart:developer';
import 'dart:math';

import 'package:drips_water/logic/auth.dart';
import 'package:drips_water/logic/create_cstmr.dart';
import 'package:drips_water/core/colors.dart';
import 'package:drips_water/logic/data_base.dart';
import 'package:drips_water/ui/screens/view_customer.dart';
import 'package:drips_water/ui/widgets/add_cstmr_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // context.read<MyDatabase>().activateListeners();
  }

  @override
  void dispose() {
    CreateCstmr().disposingControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 5),
        actions: [
          IconButton(
            onPressed: () {
              Auth.signOut(context: context);
            },
            tooltip: 'Log out',

            icon: Icon(Icons.logout_sharp, color: AppColors.bgColor),
          ),
        ],
        title: Text('DASHBOARD'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        shadowColor: Colors.black12,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // TextButton(
          //   onPressed: () {
          //     AddCustomerDialog.addcustomerDialogue(
          //       context,
          //       formKey: _formKey,
          //     );
          //   },
          //   style: TextButton.styleFrom(
          //     minimumSize: Size(318 / 2, 51),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(50),
          //     ),
          //   ),
          //   child: Text(
          //     'ADD CUSTOMER',
          //     style: Theme.of(
          //       context,
          //     ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          SizedBox(height: 4.0),
          TextButton(
            onPressed: () async {
              final database = FirebaseDatabase.instance.ref();
              try {
                await database.child('dailySpecial').update({
                  'customer/name': 'Yahya',
                });
                // await database.child('non special').update({
                //   'price': .99,
                // });
                print('Special data inserted sucksexfully');
              } catch (e) {
                print('Exception caught: $e');
              }
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => ViewCustomer()),
              // );
            },
            style: TextButton.styleFrom(
              minimumSize: Size(318 / 2, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'Simple set',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Dashboard()),
              );
              context.read<MyDatabase>().activateListeners();
            },
            child: Text('New Examples'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CUSTOMERS',
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(color: AppColors.bgColor),
            ),
            SizedBox(height: 10),
            Text(
              '${context.watch<CreateCstmr>().customer.length}',
              style: Theme.of(context).textTheme.displayLarge!,
            ),
            Text(context.watch<MyDatabase>().displayNewDescription),
          ],
        ),
      ),
    );
  }
}
