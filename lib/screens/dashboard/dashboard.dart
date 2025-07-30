import 'package:drips_water/firebasestuff/auth.dart';
import 'package:drips_water/resources/appColors/colors.dart';
import 'package:drips_water/resources/components/cstmwidgets/customformfield/custom_formfield.dart';
import 'package:drips_water/resources/components/dashboardmodel/dashboard_model.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController perdayGallonController = TextEditingController();
  TextEditingController customerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: AppColors.bgColor),
        shadowColor: Colors.black12,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder:
                    (BuildContext context) => AlertDialog(
                      scrollable: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        "Add Customer Information",
                        textAlign: TextAlign.center,
                      ),
                      content: ListBody(
                        children: <Widget>[
                          SizedBox(height: 10),
                          CustomFormField(
                            hintText: "Name",
                            validator: (value) {
                              return null;
                            },
                            controller: nameController,
                          ),
                          SizedBox(height: 20),
                          CustomFormField(
                            hintText: "Delivery Address",
                            validator: null,
                            controller: addressController,
                          ),
                          SizedBox(height: 20),
                          CustomFormField(
                            hintText: "Phone number",
                            validator: null,
                            controller: phoneController,
                          ),
                          SizedBox(height: 20),
                          CustomFormField(
                            hintText: "Per day Gallon",
                            validator: null,
                            controller: perdayGallonController,
                          ),
                          SizedBox(height: 20),
                          CustomFormField(
                            hintText: "Customer Id",
                            validator: null,
                            controller: customerIdController,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(child: Text("Add")),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(child: Text("cancel")),
                        ),
                      ],
                    ),
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
            onPressed: () {},
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
              DashboardModel.numberOfCustomers.toString(),
              style: Theme.of(context).textTheme.displayLarge!,
            ),
          ],
        ),
      ),
    );
  }
}
