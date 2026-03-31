import 'package:drips_water/src/controller/auth/auth.dart';
import 'package:drips_water/src/core/colors.dart';
import 'package:drips_water/src/model/customer_model.dart';
import 'package:drips_water/src/widgets/add_cstmr_dialog.dart';
import 'package:flutter/material.dart';

class CustomerDetail extends StatelessWidget {
  final CustomerModel customerModel;
  const CustomerDetail({super.key, required this.customerModel});

  @override
  Widget build(BuildContext context) {
    final AddCustomerDialog _addCustomerDialog = AddCustomerDialog();
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
        title: Text(customerModel.name!.toUpperCase() ?? "Customer Detail"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        shadowColor: Colors.black12,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size(318 / 2, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'ADD ENTRY',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 4.0),
          TextButton(
            onPressed: () {
              _addCustomerDialog.addcustomerDialogue(context, formKey: formKey, nameController: nameController, addressController: addressController, phoneNoController: phoneNoController, perDayCaneController: perDayCaneController, customerIdController: customerIdController, eachCanePriceController: eachCanePriceController)
            },
            style: TextButton.styleFrom(
              minimumSize: Size(318 / 2, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              'CUSTOMER DETAIL',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: ListTile(tileColor: AppColors.bgColor),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Customer detail',
      //         style: Theme.of(
      //           context,
      //         ).textTheme.displayLarge!.copyWith(color: AppColors.bgColor),
      //       ),
      //       SizedBox(height: 10),
      //     ],
      //   ),
      // ),
    );
  }
}
