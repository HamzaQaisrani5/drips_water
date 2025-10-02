import 'dart:developer';
import 'package:drips_water/logic/create_cstmr.dart';
import 'package:drips_water/core/colors.dart';
import 'package:drips_water/ui/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';

class AddCustomerDialog {
  static Future<void> addcustomerDialogue(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required VoidCallback rebuildState,
  }) async {
    CreateCstmr().createCustomerId();
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
                            controller: CreateCstmr.name,
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
                            controller: CreateCstmr.address,
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
                            controller: CreateCstmr.phone,
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
                            controller: CreateCstmr.perdayCane,
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
                            controller: CreateCstmr.customerId,
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
                            controller: CreateCstmr.eachCanePrice,
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
                            CreateCstmr().clearingControllers();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              CreateCstmr().disposingControllers();
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
                             CreateCstmr().addCustomer();
                              CreateCstmr().clearingControllers();
                              Navigator.pop(context);
                              print(CreateCstmr.customer);
                              log(
                                'customers.lenght: ${CreateCstmr.customer.length}',
                              );
                              rebuildState();
                              await Future.delayed(Duration(seconds: 1), () {
                                CreateCstmr().disposingControllers();
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