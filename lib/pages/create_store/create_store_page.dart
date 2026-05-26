import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/product_model.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/create_store_success.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_information.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_settings.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_verification.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/steps_widget.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class CreateStorePage extends StatefulWidget {
  const CreateStorePage({super.key});

  @override
  State<CreateStorePage> createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  int selectedSteps = 0;
  Map<String, Category> categories = {
    'Fashion': Category.fashion,
    'Smartphone & Tablet': Category.smartphoneTablet,
    'Otomotif': Category.otomotif,
    'Sport': Category.sport,
    'Food': Category.food,
    'Voucher Game': Category.voucherGame,
    'Electronic': Category.electronic,
    'Health & Care': Category.healthCare,
  };

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pages = {
      0: StoreInformation(),
      1: StoreSettings(),
      2: StoreVerification(),
      3: CreateStoreSuccess(),
    };
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Create Store'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StepsWidget(
                  steps: 1,
                  borderColor: selectedSteps >= 0 ? Colors.blue : Colors.grey,
                  containerColor: selectedSteps >= 0
                      ? Colors.blue
                      : Colors.white,
                  textColor: selectedSteps >= 0 ? Colors.white : Colors.black,
                ),
                StepsWidget(
                  steps: 2,
                  borderColor: selectedSteps >= 1 ? Colors.blue : Colors.grey,
                  containerColor: selectedSteps >= 1
                      ? Colors.blue
                      : Colors.white,
                  textColor: selectedSteps >= 1 ? Colors.white : Colors.black,
                ),
                StepsWidget(
                  steps: 3,
                  borderColor: selectedSteps >= 2 ? Colors.blue : Colors.grey,
                  containerColor: selectedSteps >= 2
                      ? Colors.blue
                      : Colors.white,
                  textColor: selectedSteps >= 2 ? Colors.white : Colors.black,
                ),
                StepsWidget(
                  steps: 4,
                  borderColor: selectedSteps >= 3 ? Colors.blue : Colors.grey,
                  containerColor: selectedSteps >= 3
                      ? Colors.blue
                      : Colors.white,
                  textColor: selectedSteps >= 3 ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedSteps,
        children: pages.entries.map((e) => e.value).toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //next button
            if (selectedSteps != 3)
              CustomButton(
                title: 'Next',
                onPressed: () {
                  setState(() {
                    if (selectedSteps < pages.length - 1 &&
                        selectedSteps != 3) {
                      selectedSteps++;
                    }
                  });
                },
                color: Colors.black,
                textColor: Colors.white,
                height: 45,
                width: 150,
                textSize: 18,
              ),
            //previous button
            if (selectedSteps > 0 && selectedSteps != 3)
              CustomButton(
                title: 'Previous',
                onPressed: () {
                  setState(() {
                    selectedSteps--;
                  });
                },
                color: Colors.grey,
                textColor: Colors.black,
                height: 45,
                width: 150,
                textSize: 18,
              ),
          ],
        ),
      ),
    );
  }
}
