import 'package:drips_water/logic/create_cstmr.dart';
import 'package:drips_water/core/colors.dart';
import 'package:flutter/material.dart';

class ViewCustomer extends StatelessWidget {
  const ViewCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUSTOMERS'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        shadowColor: Colors.black12,
      ),
      body:
          CreateCstmr.customer.isEmpty
              ? Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'No Customers',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                ],
              )
              : ListView.separated(
                padding: EdgeInsets.all(8.0),
                separatorBuilder: (context, index) => SizedBox(height: 5,),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return ListTile(
                    tileColor: AppColors.bgColor,
                  );
                },
              ),
    );
  }
}
