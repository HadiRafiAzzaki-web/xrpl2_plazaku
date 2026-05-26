import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/pages/main_dashboard_page.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class CreateStoreSuccess extends StatefulWidget {
  const CreateStoreSuccess({super.key});

  @override
  State<CreateStoreSuccess> createState() => _CreateStoreSuccessState();
}

class _CreateStoreSuccessState extends State<CreateStoreSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Shop Created Successfully'),
            SizedBox(height: 10),
            Text(
              'Your shop is ready to use. Start adding your first product and selling now',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: CustomButton(
          title: 'Go to Seller Page',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainDashboardPage()),
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
          height: 45,
          width: double.infinity,
          textSize: 18,
        ),
      ),
    );
  }
}
