import 'package:auto/MVC/Model/changePassword_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordController {
  final ChangePasswordModel _model = ChangePasswordModel();

  Future<void> changePassword(String currentPassword, String newPassword,
      String confirmPassword) async {
    if (currentPassword.isNotEmpty) {
      try {
        await _model.changePassword(
            currentPassword, newPassword, confirmPassword);
        // Password changed successfully, perform any additional actions if needed
      } on FirebaseAuthException catch (e) {
        // Handle authentication errors
        if (e.code == 'wrong-password') {
          // Show error message for incorrect password
        } else {
          // Handle other errors
        }
      }
    } else {
      // Show error message for empty password
    }
  }
}
