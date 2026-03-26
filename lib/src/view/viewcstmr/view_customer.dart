import 'package:drips_water/src/core/colors.dart';
import 'package:drips_water/src/services/retrieve_cstmr_data/retrieve_cstmr_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({super.key});

  @override
  State<ViewCustomer> createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer> {
  final database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      context.read<RetrieveCstmrData>().fetchCustomer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUSTOMERS'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        shadowColor: Colors.black12,
      ),
      body: Consumer<RetrieveCstmrData>(
        builder: (_, retrieveCstmrData, child) {
          return retrieveCstmrData.customerData.isEmpty
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'No Customers',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                ],
              )
              : Consumer<RetrieveCstmrData>(
                builder: (context, value, child) {
                  return ListView.separated(
                    padding: EdgeInsets.all(8.0),
                    separatorBuilder: (_, index) => SizedBox(height: 5),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        context.read<RetrieveCstmrData>().customerData.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.whitetxtColor,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          context
                                  .read<RetrieveCstmrData>()
                                  .customerData[index]
                                  .name ??
                              '',
                        ),
                        tileColor: AppColors.bgColor,
                        // subtitle: ,
                      );
                    },
                  );
                },
                // context.read<RetrieveCstmrData>().customerData.isEmpty
                //     ? Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SizedBox(height: 10),
                //         Text(
                //           'No Customers',
                //           style: Theme.of(
                //             context,
                //           ).textTheme.bodyMedium!.copyWith(color: Colors.black),
                //         ),
                //       ],
                //     )
                //     : Consumer<RetrieveCstmrData>(
                //       builder: (context, value, child) {
                //         return ListView.separated(
                //           padding: EdgeInsets.all(8.0),
                //           separatorBuilder: (_, index) => SizedBox(height: 5),
                //           scrollDirection: Axis.vertical,
                //           itemCount:
                //               context.read<RetrieveCstmrData>().customerData.length,
                //           itemBuilder: (_, index) {
                //             return ListTile(
                //               leading: CircleAvatar(
                //                 backgroundColor: AppColors.whitetxtColor,
                //                 child: Text('${index + 1}'),
                //               ),
                //               title: Text(
                //                 context
                //                         .read<RetrieveCstmrData>()
                //                         .customerData[index]
                //                         .name ??
                //                     '',
                //               ),
                //               tileColor: AppColors.bgColor,
                //               // subtitle: ,
                //             );
                //           },
                //         );
                //       },
                //     ),
              );
        },
      ),
    );
  }
}
