import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/modeOrRole/app_mode.dart';
import 'package:xrpl2_plazaku/modeOrRole/role.dart';

import '../datas/data_account.dart';
import '../models/user_model.dart';
import '../widgets/custom_input_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //_key for validation input
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPass = TextEditingController();

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
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Make your Plazaku account',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7F7F7F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomInputField(
                        controller: _name,
                        keyboardType: TextInputType.text,
                        obscure: false,
                        hint: 'Username',
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomInputField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        obscure: false,
                        hint: 'Email',
                        suffixIcon: Icon(null),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!value.contains('@')) {
                            return 'Incorrect email format';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
                        controller: _confirmPass,
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
                            setState(() {
                              if (_key.currentState!.validate()) {
                                users.add(
                                  UserModel(
                                    username: _name.text,
                                    email: _email.text,
                                    password: _password.text,
                                    isSeller: false,
                                    role: Role.buyer,
                                    currentMode: AppMode.buyer,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Sign Up success'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Sign Up failed'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            });
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7F7F7F),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF6075CC),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
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
