import 'package:drips_water/logic/create_cstmr.dart';
import 'package:drips_water/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          context.read<CreateCstmr>().customer.isEmpty
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
                itemCount: context.read<CreateCstmr>().customer.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.whitetxtColor,
                      child: Text('${index+1}'),
                    ),
                    title: Text(context.read<CreateCstmr>().customer[index]['name']),
                    tileColor: AppColors.bgColor,
                  );
                },
              ),
    );
  }
}
