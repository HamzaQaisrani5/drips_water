import 'dart:async';
import 'dart:developer';
import 'package:drips_water/src/core/colors.dart';
import 'package:drips_water/src/services/add_customer_service/add_customer_data.dart';
import 'package:drips_water/src/services/retrieve_cstmr_data/retrieve_cstmr_data.dart';
import 'package:drips_water/src/widgets/custom_formfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomerDialog extends ChangeNotifier {
  Future<void> addcustomerDialogue(
    BuildContext context, {
     GlobalKey<FormState>? formKey,
    required TextEditingController nameController,
    required TextEditingController addressController,
    required TextEditingController phoneNoController,
    required TextEditingController perDayCaneController,
    required TextEditingController customerIdController,
    required TextEditingController eachCanePriceController,
  }) async {
    // listen CreateCstmr.createCustomerId()
    await context.read<AddCustomerDialog>().createCustomerId(
      customerIdController: customerIdController,
    );
    final dbCustomers =
        await FirebaseDatabase.instance.ref().child('Customers/').get();
    await showDialog(
      context: context,
      builder:
          (_) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Dialog(
              insetPadding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              alignment: Alignment.center,
              backgroundColor: Color(0xffF4F1F8),
              elevation: 15,
              shape: BeveledRectangleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.note_alt_outlined),
                        SizedBox(width: 7),
                        Text(
                          'DETAILS',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Name
                          CustomFormField(
                            hintText: "Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name.";
                              } else if (value.length < 5) {
                                return "At lease 5 characters.";
                              }
                              return null;
                            },
                            controller: nameController,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Delivery Address',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          // Address
                          CustomFormField(
                            hintText: "Delivery Address",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field cannot be empty.";
                              }
                              return null;
                            },
                            controller: addressController,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Phone number',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          // Phone number
                          CustomFormField(
                            hintText: "Phone number",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.startsWith('923') &&
                                  value.length != 12) {
                                return 'InValid Phone Number';
                              } else if (value.startsWith('03') &&
                                  value.length != 11) {
                                return 'Invalid Phone Number';
                              } else if (!value.startsWith('03') &&
                                  !value.startsWith('923')) {
                                return 'invalid number';
                              }
                              return null;
                            },
                            controller: phoneNoController,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Cane per Day',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          // perDayCnae
                          CustomFormField(
                            hintText: "Cane per day",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field cannot be emtpy.";
                              }
                              return null;
                            },
                            controller: perDayCaneController,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Customer ID',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          // Customer Id
                          CustomFormField(
                            controller: customerIdController,
                            readOnly: true,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Each Cane Price',
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          // Each Cane price
                          CustomFormField(
                            hintText: "Each Cane Price",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Cannot be empty";
                              }
                              return null;
                            },
                            controller: eachCanePriceController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(70, 20),
                            shape: BeveledRectangleBorder(),
                            overlayColor: Colors.black12,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            clearingControllers(
                              name: nameController,
                              address: addressController,
                              phone: phoneNoController,
                              perdayCane: perDayCaneController,
                              eachCanePrice: eachCanePriceController,
                            );
                          },
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: AppColors.bgColor),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(70, 20),
                            shape: BeveledRectangleBorder(),
                            overlayColor: Colors.black12,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () async {
                            if (formKey!.currentState!.validate()) {
                              await context.read<MyDatabase>().addToDatabase(
                                context: context,
                                name: nameController.text.trim(),
                                address: addressController.text.trim(),
                                phoneNo: phoneNoController.text.trim(),
                                perDayCane: perDayCaneController.text.trim(),
                                customerId: customerIdController.text.trim(),
                                eachCanePrice:
                                    eachCanePriceController.text.trim(),
                              );
                              await context
                                  .read<RetrieveCstmrData>()
                                  .fetchCustomer();
                              clearingControllers(
                                name: nameController,
                                address: addressController,
                                phone: phoneNoController,
                                perdayCane: perDayCaneController,
                                eachCanePrice: eachCanePriceController,
                              );
                              Navigator.pop(context);
                              log('dbCustomers: ${dbCustomers.value}');
                            }
                            // FirebaseDatabase.instance
                            //     .ref()
                            //     .child('Customers/')
                            //     .onValue
                            //     .listen((data) {
                            //       log('Database: ${data.snapshot.value}');
                            //     });
                          },
                          child: Text(
                            'Save',
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: AppColors.bgColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Future<void> createCustomerId({
    required TextEditingController customerIdController,
  }) async {
    String signature = 'DW417';
    final DatabaseReference dbInstance = FirebaseDatabase.instance.ref();
    Map? wholeDb;
    try {
      DatabaseReference customers = dbInstance.child('Customers/');
      customers.onValue.listen((data) {
        wholeDb = data.snapshot.value as Map?;
        if (wholeDb == null || wholeDb!.isEmpty) {
          // when there is no customer
          customerIdController.text = '${signature}1';
          log('Customer Id generated: ${customerIdController.text}');
        } else {
          final lastKey = wholeDb!.keys.last;
          log('lastKey: $lastKey');
          final split = lastKey.split('DW417'); //[ , <last number>]
          final extractLastSplitted = int.parse(
            split[split.length - 1],
          ); // last number
          customerIdController.text =
              signature +
              (extractLastSplitted + 1).toString(); //DW417(last number + 1)
          log('Customer Id generated: ${customerIdController.text}');
        }
      });
    } catch (e) {
      log('Exception Caught while generating customer ID $e');
    }
    notifyListeners();
  }

  void addCustomer({
    required TextEditingController? nameController,
    required TextEditingController? addressController,
    required TextEditingController? phoneNoController,
    required TextEditingController? perDayCaneController,
    required TextEditingController? customerIdController,
    required TextEditingController? eachCanePriceController,
  }) {
    // customer.add({
    //   'name': nameController!.text.trim(),
    //   'address': addressController!.text.trim(),
    //   'phone': phoneNoController!.text.trim(),
    //   'perDayCane': perDayCaneController!.text.trim(),
    //   'customerId': customerIdController!.text,
    //   'eachCanePrice': eachCanePriceController!.text.trim(),
    // });
    notifyListeners();
  }

  void clearingControllers({
    required TextEditingController name,
    required TextEditingController address,
    required TextEditingController phone,
    required TextEditingController perdayCane,
    required TextEditingController eachCanePrice,
  }) {
    name.clear();
    address.clear();
    phone.clear();
    perdayCane.clear();
    eachCanePrice.clear();
  }
}
