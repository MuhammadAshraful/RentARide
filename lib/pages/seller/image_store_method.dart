import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  addNewCar({
    required String carName,
    required String model,
    required String rate,
    required String location,
    required Uint8List file,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      user = auth.currentUser;
      String imageUrl = await uploadImageToStorage(uniqueFileName, file);

      if (user!.uid != null) {
        var id = user.uid.toString();
        FirebaseFirestore.instance.collection('mycarList').add({
          'car_name': carName,
          'model': model,
          'rate': rate,
          "location": location,
          "id": id,
          "userId": user.uid.toString(),
          'url': imageUrl, // No need for toString()
        });

        Get.snackbar("Message", "Car Successfully stored");
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      print("Authentication error: ${e.message}");
    } on FirebaseException catch (e) {
      // Handle other Firebase errors
      print("Firebase error: ${e.message}");
    } catch (e) {
      // Handle general errors
      print("Unexpected error: ${e.toString()}");
    }
    return user;
  }
}
