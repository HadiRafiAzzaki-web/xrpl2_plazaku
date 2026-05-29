import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/delivery_method_model.dart';
import 'package:xrpl2_plazaku/models/payment_method_model.dart';

import '../../../models/create_store_model.dart';
import '../widget/create_store_input_widget.dart';
import '../widget/dropdown_button_widget.dart';

class StoreSettings extends StatefulWidget {
  final CreateStoreModel storeData;

  const StoreSettings({super.key, required this.storeData});

  @override
  State<StoreSettings> createState() => _StoreSettingsState();
}

class _StoreSettingsState extends State<StoreSettings> {
  final _key = GlobalKey<FormState>();
  late var shopUsername = TextEditingController();
  PaymentMethod? selectedPayment;
  DeliveryMethod? selectedDelivery;

  final Map<String, PaymentMethod> paymentMethod = {
    'All': PaymentMethod.all,
    'E-wallet': PaymentMethod.eWallet,
    'Cod': PaymentMethod.cod,
    'Transfer': PaymentMethod.transfer,
  };

  final Map<String, DeliveryMethod> deliveryMethod = {
    'All': DeliveryMethod.all,
    'Expedition Courier': DeliveryMethod.expeditionCourier,
    'Take it Yourself': DeliveryMethod.takeItYourself,
  };

  @override
  void initState() {
    super.initState();
    shopUsername = TextEditingController(text: widget.storeData.shopUsername);
    selectedDelivery = widget.storeData.deliveryMethod;
    selectedPayment = widget.storeData.paymentMethod;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Store Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 30),
            CreateStoreInputWidget(
              controller: shopUsername,
              hint: 'Enter shop username',
              title: 'Shop Username',
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return 'Shop username is required';
                }
                return null;
              },
              onChanged: (p0) {
                setState(() {
                  widget.storeData.shopUsername = shopUsername.text;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonWidget(
              title: 'Delivery Method',
              value: selectedDelivery,
              dropdown: deliveryMethod.entries
                  .map(
                    (e) => DropdownMenuItem(value: e.value, child: Text(e.key)),
                  )
                  .toList(),
              onChanged: (p0) {
                setState(() {
                  selectedDelivery = p0;
                  widget.storeData.deliveryMethod = selectedDelivery;
                });
              },
              validator: (p0) {
                if (p0 == null) {
                  return 'Delivery is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            DropdownButtonWidget(
              title: 'Payment Method',
              value: selectedPayment,
              dropdown: paymentMethod.entries
                  .map(
                    (e) => DropdownMenuItem(value: e.value, child: Text(e.key)),
                  )
                  .toList(),
              onChanged: (p0) {
                setState(() {
                  selectedPayment = p0;
                  widget.storeData.paymentMethod = selectedPayment;
                });
              },
              validator: (p0) {
                if (p0 == null) {
                  return 'Payment is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
