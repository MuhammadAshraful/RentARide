import 'package:auto/MVC/Controller/verifyEmail_controller.dart';
import 'package:auto/MVC/Model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../pages/userType.dart';

class LoginController {
  final LoginModel _loginModel = LoginModel();
  final EmailVerificationController _emailVerificationController =
      EmailVerificationController();

  Future<void> handleLogin(String email, String password) async {
    //   User? user = FirebaseAuth.instance.currentUser;
    // await user?.reload();
    // print(user);
    User user = await _loginModel.login(email: email, password: password);
    // Handle UI updates based on login result (e.g., show a message, navigate to the next screen)
    if (user.emailVerified) {
      // User is verified, continue with your app logic
      try {
        //   User user = await _loginModel.login(email: email, password: password);
        var uId = user.uid;
        if (uId != null) {
          Get.to(Home(
            user: user,
          ));
        }

        //   userList = querySnapshot.docs.map((e) => kako.User.fromMap(e.data())).toList();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          Get.snackbar("Email", "No user found for that email");
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
          Get.snackbar("Password", "Wrong password provided.");
        }
      }
    } else {
      Get.snackbar('Email not verified',
          'Check your email and click the link to activate your account',
          snackPosition: SnackPosition.BOTTOM);
      //   final user = FirebaseAuth.instance.currentUser;
      await _emailVerificationController.handleSendEmailVerification();
    }
  }
}
