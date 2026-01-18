// import 'dart:developer';
import 'package:drips_water/logic/auth.dart';
import 'package:drips_water/logic/create_cstmr.dart';
import 'package:drips_water/core/colors.dart';
import 'package:drips_water/logic/data_base.dart';
// import 'package:drips_water/resources/components/cstmwidgets/customformfield/custom_formfield.dart';
// import 'package:drips_water/resources/components/validationmodel/validations.dart';
import 'package:drips_water/ui/screens/view_customer.dart';
import 'package:drips_water/ui/widgets/add_cstmr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // final _formKey = GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   CreateCstmr().disposingControllers();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
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
              AddCustomerDialog.addcustomerDialogue(
                context,
                formKey: _formKey,
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
      ), */
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
            Text('Age is: ${myDatabase.databaseJson}'),
            Text('newAge is: ${myDatabase.ageOne}'),
            Text('newAge is: ${myDatabase.ageTwo}'),
            Text('Age is: ${myDatabase.status}'),
            StreamBuilder(
              stream: myDatabase.dbref.onValue,
              builder: (context, AsyncSnapshot snap) {
                if (snap.hasData &&
                    !(snap.hasError) &&
                    myDatabase.databaseJson != null) {
                  Map data = snap.data;
                  List item = [];
                  data.forEach((index, data) {
                    item.add({'key': index, ...data});
                  });
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Customer: ${item[index]['key']}'),
                          subtitle: Text(
                            'Age: ${item[index]['age'].toString()}\nStatus: ${item[index]['status']}',
                          ),
                          isThreeLine: true,
                        );
                      },
                      itemCount: item.length,
                    ),
                  );
                } else {
                  return Center(child: Text('No data'));
                }
              },
            ),
            // Text(
            //   '${context.watch<CreateCstmr>().customer.length}',
            //   style: Theme.of(context).textTheme.displayLarge!,
            // ),
          ],
        ),
      ),
    );
  }
}
