import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/register_controller.dart';
import '../MVC/Controller/register_controller.dart';
import '../Model/register_model.dart';

class RegistrationPageo extends StatefulWidget {
  @override
  State<RegistrationPageo> createState() => _RegistrationPageoState();
}

class _RegistrationPageoState extends State<RegistrationPageo> {
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
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.amber,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Color(0xFF00FF00),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: mobile,
                          decoration: InputDecoration(
                            labelText: "Mobile",
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.userModel.name = name.text;
                              _controller.userModel.password = password.text;
                              _controller.userModel.email = email.text;
                              _controller.userModel.userType = userType;
                              _controller.userModel.mobile = mobile.text;
                              _handleRegistration();
                            },
                            child: Text(
                              "REGISTER",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        //   height: 100, // Adjust the height as needed
                      ], // color: Colors.amber,
                    ), // Other properties of the container
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleRegistration() async {
    bool result = await _controller.handleRegistration();
    if (result == true) {
      Get.snackbar("Registration Successfully Done", "");
    }
  }
}
