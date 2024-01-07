import 'package:auto/MVC/Controller/verifyEmail_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../View/verify_email.dart';

class RegisterModel {
  String name;
  String mobile;
  String userType;
  String email;
  String password;

  RegisterModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.userType,
      required this.mobile});

  register() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final EmailVerificationController _emailVerifyController =
        EmailVerificationController();
    _emailVerifyController.handleSendEmailVerification();

    user = userCredential.user;
    // ignore: deprecated_member_use
    await user!.updateProfile(displayName: name);
    await user.reload();
    user = auth.currentUser;
    if (user!.uid != null) {
      FirebaseFirestore.instance.collection('user').add({
        'name': name,
        'mobile': mobile,
        'userType': userType,
        "id": user.uid.toString()
      });
    }
    /*on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }*/
    return user;
  }
}
