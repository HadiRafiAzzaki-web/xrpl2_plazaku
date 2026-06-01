import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/models/create_store_model.dart';
import 'package:xrpl2_plazaku/pages/main_dashboard_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';
import 'package:xrpl2_plazaku/widgets/custom_button.dart';

class CreateStoreSuccess extends StatefulWidget {
  final CreateStoreModel storeData;

  const CreateStoreSuccess({super.key, required this.storeData});

  @override
  State<CreateStoreSuccess> createState() => _CreateStoreSuccessState();
}

class _CreateStoreSuccessState extends State<CreateStoreSuccess> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = appService.userModel;
    if (user == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          emissionFrequency: 0.05,
          numberOfParticles: 20,
          gravity: 0.2,
          colors: [
            Colors.green,
            Colors.blue,
            Colors.orange,
            Colors.pink,
            Colors.purple,
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 110),
              SizedBox(height: 24),
              Text(
                '${widget.storeData.shopName} Created Successfully',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Your shop is ready to use. Start adding your first product and selling now.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              CustomButton(
                title: 'Go to Seller Page',
                onPressed: () {
                  storeService.addStore(user.id, widget.storeData);
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainDashboardPage(),
                    ),
                    (route) => false,
                  );
                },
                color: Colors.blue,
                textColor: Colors.white,
                height: 50,
                width: double.infinity,
                textSize: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
