import 'package:drips_water/src/core/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
enum popupItem { delieveryDetails, customerInfo }

class CustomerTilePopupMenuButton extends StatefulWidget {
  const CustomerTilePopupMenuButton({super.key});

  @override
  State<CustomerTilePopupMenuButton> createState() =>
      _CustomerTilePopupMenuStateButton();
}

class _CustomerTilePopupMenuStateButton
    extends State<CustomerTilePopupMenuButton> {
  popupItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<popupItem>(
      surfaceTintColor: AppColors.bgColor,
      initialValue: selectedItem,
      onSelected: (popupItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry<popupItem>>[
            const PopupMenuItem<popupItem>(
              value: popupItem.delieveryDetails,
              child: Text('Delivery details'),
            ),
            const PopupMenuItem<popupItem>(
              value: popupItem.customerInfo,
              child: Text('Customer Info'),
            ),
          ],
    );
  }
}
