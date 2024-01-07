import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationModel {
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
  }
}
