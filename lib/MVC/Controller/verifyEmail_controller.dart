import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/verifyEmail_model.dart';
import 'package:auto/MVC/View/verify_email.dart';

class EmailVerificationController {
  final EmailVerificationModel _model = EmailVerificationModel();
  final VerifyEmail _verifyEmailView = VerifyEmail();

  Future<void> handleSendEmailVerification() async {
    await _model.sendEmailVerification();
    Get.to(VerifyEmail());
  }
}
