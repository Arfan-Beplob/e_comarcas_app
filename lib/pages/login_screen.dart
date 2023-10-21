import 'dart:developer';
import 'dart:math';

import 'package:e_comarcas_app/auth/auth_service.dart';
import 'package:e_comarcas_app/pages/dashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailControler = TextEditingController();
  final _passControler = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  bool isVisible = true;
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[500],
        body: Form(
          key: _fromKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                //image
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/onlinecare.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //Text
                 //TextFormField
                Center(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome Again',
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 1,
                                wordSpacing: 1,
                                textBaseline: TextBaseline.ideographic,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 40),
                            child: TextFormField(
                              controller: _emailControler,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.teal,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can`t Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 40),
                            child: TextFormField(
                              obscureText: isVisible,
                              controller: _passControler,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.teal,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: Icon(isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This Field Can`t Empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: _loginAdmin,
                    child: const Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.teal
                    ),
                    ),
                  ),
                ),
                Text(errorMsg,style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginAdmin() async {

    if (_fromKey.currentState!.validate()) {
      final email = _emailControler.text;
      final password = _passControler.text;
      try {
        final user = AuthService.loginAdmin(email, password);
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      } on FirebaseAuthException catch (error) {
        setState(() {
          errorMsg = error.message!;
          Fluttertoast.showToast(
              msg: "${error.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });

      }
    }
  }
}
