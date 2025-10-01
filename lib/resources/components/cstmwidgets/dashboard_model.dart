import 'dart:developer';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
// import 'package:drips_water/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import '../../appColors/colors.dart';
import '../../../ui/widgets/custom_formfield.dart';

class DashboardModel {
  static int numberOfCustomers = 0;
  static TextEditingController name = TextEditingController();
  static TextEditingController address = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController perdayCane = TextEditingController();
  static TextEditingController eachCanePrice = TextEditingController();
  static List<Map> customer = [];
  static TextEditingController customerId = TextEditingController();

  static void createCustomerId() {
    String signature = 'DW417';
    if (customer.isEmpty) {
      customerId.text = signature + (customer.length + 1).toString();
    } else {
      var split = customer.last['customerId'].toString().split('DW417');
      customerId.text =
          signature + (int.parse(split[split.length - 1]) + 1).toString();
    }
  }

  static void addCustomer() {
    customer.add({
      'name': name.text.trim(),
      'address': address.text.trim(),
      'phone': phone.text.trim(),
      'perdayCane': perdayCane.text.trim(),
      'customerId': customerId.text,
      'eachCanePrice': eachCanePrice.text.trim(),
    });
  }

  // Clearing all controller for new customer
  static void clearingControllers() {
    name.clear();
    address.clear();
    phone.clear();
    perdayCane.clear();
    customerId.clear();
    eachCanePrice.clear();
  }

  static void disposingControllers() {
    name.dispose();
    address.dispose();
    phone.dispose();
    perdayCane.dispose();
    customerId.dispose();
    eachCanePrice.dispose();
  }

  // Alert Dialogue of customer details
  static Future<void> addcustomerDialogue(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required VoidCallback rebuildState,
  }) async {
    createCustomerId();
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
                            controller: DashboardModel.name,
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
                            controller: DashboardModel.address,
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
                            controller: DashboardModel.phone,
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
                            controller: DashboardModel.perdayCane,
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
                            controller: DashboardModel.customerId,
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
                            controller: DashboardModel.eachCanePrice,
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
                            clearingControllers();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              disposingControllers();
                              log('Controllers disposed successfully');
                            });
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
                            if (formKey.currentState!.validate()) {
                              addCustomer();
                              clearingControllers();
                              Navigator.pop(context);
                              print(DashboardModel.customer);
                              log(
                                'customers.lenght: ${DashboardModel.customer.length}',
                              );
                              rebuildState();
                              await Future.delayed(Duration(seconds: 1), () {
                                disposingControllers();
                                log('Controllers disposed successfully');
                              });
                            }
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
}
