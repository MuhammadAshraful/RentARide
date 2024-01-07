import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';

import '../Model/register_model.dart';
import 'package:auto/MVC/View/registration_page.dart';

// registration_controller.dart

class RegistrationController {
  final RegisterModel userModel = RegisterModel(
      name: '', email: '', password: '', userType: "", mobile: "");
  bool registrationResult = true;
  // Method to handle user registration
  Future<bool> handleRegistration() async {
    try {
      await userModel.register();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      bool registrationResult = false;
    } catch (e) {
      print(e);
      bool registrationResult = false;
    }
    return registrationResult;
  }
}

 /* register(
                        name: name.text.toString(),
                        mobile: mobile.text.toString(),
                        email: email.text.toString(),
                        password: password.text.toString(),
                        userType: userType); */


