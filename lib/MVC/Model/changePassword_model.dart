import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordModel {
  Future<void> changePassword(String currentPassword, String newPassword,
      String confirmPassword) async {
    // Reauthenticate with current password
    User? user = FirebaseAuth.instance.currentUser;
    await user!.reauthenticateWithCredential(EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    ));

    // Current password is correct
    // Proceed with password update
    // ...
    final _newPassword = newPassword;
    final _confirmNewPassword = confirmPassword;
    if (_newPassword == _confirmNewPassword) {
      user.updatePassword(_newPassword).then((_) {
        // Password updated successfully
        // ...
      }).catchError((error) {
        // Handle errors during password update
      });
    }
  }
}
