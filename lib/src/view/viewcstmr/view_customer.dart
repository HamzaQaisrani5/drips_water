import 'package:drips_water/src/core/colors.dart';
import 'package:drips_water/src/services/retrieve_cstmr_data/retrieve_cstmr_data.dart';
import 'package:drips_water/src/view/customer_detail/customer_detail.dart';
import 'package:drips_water/src/widgets/customer_tile_popupmenu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCustomer extends StatefulWidget {
  const ViewCustomer({super.key});

  @override
  State<ViewCustomer> createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // ignore: use_build_context_synchronously
      await context.read<RetrieveCstmrData>().fetchCustomer();
    });
  }

  final database = FirebaseDatabase.instance.ref();

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
          child =
              retrieveCstmrData.customerData.isEmpty
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

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
                  : ListView.separated(
                    padding: EdgeInsets.all(8.0),
                    separatorBuilder: (_, index) => SizedBox(height: 5),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        context.read<RetrieveCstmrData>().customerData.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        onTap: () {
                          final customer =
                              context.read<RetrieveCstmrData>().customerData[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CustomerDetail(customerModel: customer,)),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor: AppColors.whitetxtColor,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          context
                                  .read<RetrieveCstmrData>()
                                  .customerData[index]
                                  .name ??
                              'N/A',
                        ),
                        tileColor: AppColors.bgColor,
                        trailing: CustomerTilePopupMenuButton(),
                      );
                    },
                  );
          return child;
        },
      ),
    );
  }
}
