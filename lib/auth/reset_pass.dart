import 'package:flutter/material.dart';

import '../datas/data_account.dart';
import '../widgets/custom_input_field.dart';
import 'login.dart';

class ResetPass extends StatefulWidget {
  final String email;

  const ResetPass({super.key, required this.email});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _key = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool _obscurePass = true;
  bool _obscureConfirm = true;

  //to disguise the password and confirm
  void isObscurePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  void isObscureConfirm() {
    setState(() {
      _obscureConfirm = !_obscureConfirm;
    });
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
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Color(0xFF000000)),
              ),
              color: Color(0xFFFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Reset Your Password',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Make sure you can remember the new password you choose',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7F7F7F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomInputField(
                        controller: _password,
                        keyboardType: TextInputType.text,
                        obscure: _obscurePass,
                        hint: 'Password',
                        suffixIcon: IconButton(
                          onPressed: isObscurePass,
                          icon: Icon(
                            _obscurePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password minimum 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomInputField(
                        controller: _confirmPassword,
                        keyboardType: TextInputType.text,
                        obscure: _obscureConfirm,
                        hint: 'Confirm Pass',
                        suffixIcon: IconButton(
                          onPressed: isObscureConfirm,
                          icon: Icon(
                            _obscureConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm is required';
                          }
                          if (value != _password.text) {
                            return 'Passwords are not the same';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF000000),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              final index = users.indexWhere(
                                (user) =>
                                    user.email.toLowerCase() ==
                                    widget.email.trim().toLowerCase(),
                              );
                              if (users[index].password ==
                                  _password.text.trim()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'New password must be different',
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                              if (index != -1) {
                                users[index].password = _password.text;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Password changed successfully',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('User not found'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
