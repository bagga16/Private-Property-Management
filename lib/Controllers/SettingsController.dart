// import 'dart:convert';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:private_property_management/Models/userModel.dart';

// class SettingsController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final DatabaseReference _realtimeDB =
//       FirebaseDatabase.instance.ref().child('profile_pictures');

//   Rx<UserModel> userModel = UserModel().obs;
//   RxBool isLoading = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserData();
//   }

//   /// Fetch user data from Firestore and Realtime Database
//   Future<void> fetchUserData() async {
//     try {
//       isLoading.value = true;
//       final userId = _auth.currentUser?.uid;
//       if (userId != null) {
//         final doc = await _firestore.collection('users').doc(userId).get();
//         final Map<String, dynamic> data = doc.data() ?? {};

//         // Fetch profile picture
//         final snapshot = await _realtimeDB.child(userId).get();
//         data['profilePic'] = snapshot.exists ? snapshot.value as String : null;

//         userModel.value = UserModel.fromFirestore(data);
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch user data: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Update user field
//   Future<void> editUserField(String field, String value) async {
//     try {
//       final userId = _auth.currentUser?.uid;
//       if (userId != null) {
//         await _firestore.collection('users').doc(userId).update({field: value});
//         userModel.value = userModel.value.copyWith(
//           name: field == "name" ? value : userModel.value.name,
//           role: field == "role" ? value : userModel.value.role,
//           phone: field == "phone" ? value : userModel.value.phone,
//         );
//         Get.snackbar("Success", "$field updated successfully");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to update $field: $e");
//     }
//   }

//   /// Update profile picture
//   Future<void> updateProfilePicture() async {
//     try {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         final userId = _auth.currentUser?.uid;
//         if (userId != null) {
//           final imageBytes = await File(pickedFile.path).readAsBytes();
//           final imageBase64 = base64Encode(imageBytes);

//           await _realtimeDB.child(userId).set(imageBase64);

//           userModel.value = userModel.value.copyWith(profilePic: imageBase64);
//           Get.snackbar("Success", "Profile picture updated successfully");
//         }
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to update profile picture: $e");
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_property_management/Models/userModel.dart';

class SettingsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB =
      FirebaseDatabase.instance.ref().child('profile_pictures');

  Rx<UserModel> userModel = UserModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  /// Fetch user data from Firestore and Realtime Database
  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final doc = await _firestore.collection('users').doc(userId).get();
        final Map<String, dynamic> data = doc.data() ?? {};

        // Include userId in the data
        data['userId'] = userId;

        // Fetch profile picture
        final snapshot = await _realtimeDB.child(userId).get();
        data['profilePic'] = snapshot.exists ? snapshot.value as String : null;

        userModel.value = UserModel.fromFirestore(data);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Update user field
  Future<void> editUserField(String field, String value) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _firestore.collection('users').doc(userId).update({field: value});
        userModel.value = userModel.value.copyWith(
          name: field == "name" ? value : userModel.value.name,
          role: field == "role" ? value : userModel.value.role,
          phone: field == "phone" ? value : userModel.value.phone,
        );
        Get.snackbar("Success", "$field updated successfully");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update $field: $e");
    }
  }

  /// Update profile picture
  Future<void> updateProfilePicture() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final userId = _auth.currentUser?.uid;
        if (userId != null) {
          final imageBytes = await File(pickedFile.path).readAsBytes();
          final imageBase64 = base64Encode(imageBytes);

          await _realtimeDB.child(userId).set(imageBase64);

          userModel.value = userModel.value.copyWith(profilePic: imageBase64);
          Get.snackbar("Success", "Profile picture updated successfully");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update profile picture: $e");
    }
  }
}
