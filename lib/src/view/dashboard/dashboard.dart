import 'dart:developer';

import 'package:drips_water/src/controller/auth/auth.dart';
import 'package:drips_water/src/core/colors.dart';
import 'package:drips_water/src/services/retrieve_cstmr_data/retrieve_cstmr_data.dart';
import 'package:drips_water/src/view/viewcstmr/view_customer.dart';
import 'package:drips_water/src/widgets/add_cstmr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController perdayCane = TextEditingController();
  TextEditingController eachCanePrice = TextEditingController();
  TextEditingController customerId = TextEditingController();
  late final provider = context.read<RetrieveCstmrData>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // ignore: use_build_context_synchronously
      await context.read<RetrieveCstmrData>().fetchCustomer();
    });
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    phone.dispose();
    perdayCane.dispose();
    customerId.dispose();
    eachCanePrice.dispose();
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
          TextButton(
            onPressed: () {
              context.read<AddCustomerDialog>().addcustomerDialogue(
                context,
                formKey: _formKey,
                nameController: name,
                addressController: address,
                phoneNoController: phone,
                perDayCaneController: perdayCane,
                customerIdController: customerId,
                eachCanePriceController: eachCanePrice,
              );
            },
            style: TextButton.styleFrom(
              minimumSize: Size(318 / 2, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'ADD CUSTOMER',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 4.0),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ViewCustomer()),
              );
            },
            style: TextButton.styleFrom(
              minimumSize: Size(318 / 2, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'VIEW CUSTOMER',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
                '${context.watch<RetrieveCstmrData>().customerData.length}',
                style: Theme.of(context).textTheme.displayLarge!,
              )
          ],
        ),
      ),
    );
  }
}
