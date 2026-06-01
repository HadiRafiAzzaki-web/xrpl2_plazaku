import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/create_store_success.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_information.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_settings.dart';
import 'package:xrpl2_plazaku/pages/create_store/steps/store_verification.dart';
import 'package:xrpl2_plazaku/pages/create_store/widget/steps_widget.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

import '../../models/create_store_model.dart';

class CreateStorePage extends StatefulWidget {
  const CreateStorePage({super.key});

  @override
  State<CreateStorePage> createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  int selectedSteps = 0;

  @override
  Widget build(BuildContext context) {
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
      body: _buildPage(selectedSteps),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            //next button
            if (selectedSteps < 3)
              CustomButton(
                title: 'Next',
                onPressed: () {
                  setState(() {
                    selectedSteps++;
                  });
                },
                color: Colors.black,
                textColor: Colors.white,
                height: 45,
                width: 150,
                textSize: 18,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int selectedStep) {
    switch (selectedStep) {
      case 0:
        return StoreInformation(storeData: createStoreData);
      case 1:
        return StoreSettings(storeData: createStoreData);
      case 2:
        return StoreVerification(storeData: createStoreData);
      case 3:
        return CreateStoreSuccess(storeData: createStoreData);
      default:
        return StoreInformation(storeData: createStoreData);
    }
  }
}
