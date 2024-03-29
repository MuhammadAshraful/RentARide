import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/register_controller.dart';
import '../Model/register_model.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RegistrationController _controller = RegistrationController();
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController mobile;
  late final TextEditingController name;
  final userType = "Buyer";

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    mobile = TextEditingController();
    name = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    mobile.dispose();
    name.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xf9d423).withOpacity(1),
                      Color(0xff4e50).withOpacity(1),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/logo4.png',
                        height: 100.h, // Adjust the height as needed
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 350, // Set the maximum width
                        ),
                        child: TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 350, // Set the maximum width
                        ),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 18),
                            prefixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 350, // Set the maximum width
                        ),
                        child: TextFormField(
                          controller: mobile,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            prefixIcon: Icon(Icons.phone),
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 350, // Set the maximum width
                        ),
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.userModel.name = name.text;
                              _controller.userModel.password = password.text;
                              _controller.userModel.email = email.text;
                              _controller.userModel.userType = userType;
                              _controller.userModel.mobile = mobile.text;
                              _handleRegistration();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Set the border radius
                              ),
                              minimumSize: Size(
                                  300, 48), // Set your desired background color
                            ),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.amber,
    );
  }

  Future<void> _handleRegistration() async {
    bool result = await _controller.handleRegistration();
    if (result == true) {
      Get.snackbar("Registration Successfully Done", "");
    }
  }
}
