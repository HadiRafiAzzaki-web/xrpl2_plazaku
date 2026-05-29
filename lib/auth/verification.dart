import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:xrpl2_plazaku/datas/data_account.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';
import 'package:xrpl2_plazaku/pages/main_dashboard_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

class Verification extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNum;
  final String password;

  const Verification({
    super.key,
    required this.phoneNum,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  int randomCode = 100000 + Random().nextInt(900000);

  Timer? timer;

  int otpTimer = 60;

  @override
  void initState() {
    super.initState();
    otpTimerResend();
    debugPrint('========================');
    debugPrint('OTP CODE: $randomCode');
    debugPrint('========================');
  }

  void otpTimerResend() {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (otpTimer == 0) {
        timer.cancel();
      } else {
        setState(() {
          otpTimer--;
        });
      }
    });
  }

  void otpResend() {
    setState(() {
      randomCode = 100000 + Random().nextInt(900000);
      otpTimer = 60;
    });
    otpTimerResend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Color(0xFF000000)),
              ),
              color: Color(0xFFFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter OTP Code',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Check your SMS, We`ve sent a one-time verification to ${widget.phoneNum}. Enter the code below to verify your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF7F7F7F)),
                    ),
                    SizedBox(height: 30),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      showFieldAsBox: true,
                      filled: true,
                      fillColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      fieldWidth: 38,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      onSubmit: (String verificationCode) {
                        if (int.tryParse(verificationCode) == randomCode) {
                          final user = UserModel(
                            id: DateTime.now().millisecondsSinceEpoch,
                            phoneNum: widget.phoneNum,
                            isSeller: false,
                            username: widget.name,
                            email: widget.email,
                            password: widget.password,
                            role: Role.buyer,
                            currentMode: AppMode.buyer,
                            location: '',
                          );
                          users.add(user);
                          appService.login(user);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainDashboardPage(),
                            ),
                            (route) => false,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'OTP code correct',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'OTP code incorrect',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Text('You can resend the code in $otpTimer seconds'),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        if (otpTimer == 0) {
                          otpResend();
                        } else {
                          null;
                        }
                      },
                      child: Text(otpTimer == 0 ? 'Resend' : 'Wait'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
