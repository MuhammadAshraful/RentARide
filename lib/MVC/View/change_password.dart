import 'package:auto/MVC/Controller/changePassword_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final ChangePasswordController _changePasswordController =
      ChangePasswordController();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmNewPassword = true;

  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmNewPasswordController;

  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            //   SizedBox(height: 200),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xF9d423).withOpacity(1),
                    Color(0xFF4e50).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Make sure you enter valid current password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 44.0),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0), // Adjust padding as needed
              decoration: BoxDecoration(
                // Add any other decoration properties you need
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.white), // Example border
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _currentPasswordController,
                    obscureText: _obscureCurrentPassword, // Add this line
                    decoration: InputDecoration(
                      labelText: 'Current Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureCurrentPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureCurrentPassword = !_obscureCurrentPassword;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 44.0),
                  TextField(
                    controller: _newPasswordController,
                    obscureText: _obscureNewPassword,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 44.0),
                  TextField(
                    controller: _confirmNewPasswordController,
                    obscureText: _obscureConfirmNewPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmNewPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmNewPassword =
                                !_obscureConfirmNewPassword;
                          });
                        },
                      ),
                    ),
                  ),

                  //  SizedBox(height: 24.0),
                  SizedBox(height: 44.0),
                  ElevatedButton(
                    onPressed: () {
                      _changePasswordController.changePassword(
                          _currentPasswordController.text,
                          _newPasswordController.text,
                          _confirmNewPasswordController.text);
                    },
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Adjust the value as needed
                      ),
                      minimumSize: Size(double.infinity,
                          48), // Set the minimum width and height
                    ),
                  ),

                  // Add a button or other UI element to proceed to the next step
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
