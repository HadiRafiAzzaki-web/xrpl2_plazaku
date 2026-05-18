import 'package:flutter/material.dart';
import 'package:xrpl2_plazaku/auth/register.dart';
import 'package:xrpl2_plazaku/datas/data_account.dart';
import 'package:xrpl2_plazaku/models/user_model.dart';
import 'package:xrpl2_plazaku/pages/main_dashboard_page.dart';
import 'package:xrpl2_plazaku/services/app_service.dart';

import '../widgets/custom_input_field.dart';
import 'forgot_pass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _password = TextEditingController();

  bool _isObscure = true;

  void isObscurePass() {
    setState(() {
      _isObscure = !_isObscure;
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
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Login to your existing account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF7F7F7F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          'Password',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomInputField(
                        controller: _password,
                        keyboardType: TextInputType.text,
                        obscure: _isObscure,
                        hint: 'Password',
                        suffixIcon: IconButton(
                          onPressed: isObscurePass,
                          icon: Icon(
                            _isObscure
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
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPass(),
                              ),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF6075CC),
                              fontSize: 14,
                            ),
                          ),
                        ),
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
                                UserModel? user;
                                try {
                                  user = users.firstWhere(
                                    (element) =>
                                        element.username == _name.text &&
                                        element.password == _password.text,
                                  );
                                } catch (e) {
                                  user = null;
                                }
                                if (user == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Incorrect name or password',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                appService.login(user);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainDashboardPage(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Did`nt have an account?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7F7F7F),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
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
