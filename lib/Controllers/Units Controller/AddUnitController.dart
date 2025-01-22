// import 'dart:io';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:image_picker/image_picker.dart';

// class AddUnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

//   RxList<File> selectedImages = <File>[].obs;
//   RxBool isLoading = false.obs;

//   // Add Unit Function
//   Future<void> addUnit({
//     required String name,
//     required String unitId,
//     required String propertyId,
//     required String status,
//     required String rentAmount,
//     required String area,
//     required String description,
//   }) async {
//     try {
//       isLoading.value = true;

//       // Generate a document ID for the Firestore document
//       DocumentReference newDocRef = firestore.collection("All Units").doc();
//       String documentId = newDocRef.id;

//       // Upload images to Firebase Realtime Database
//       List<String> imageKeys = [];
//       for (var image in selectedImages) {
//         String base64Image = base64Encode(await image.readAsBytes());

//         DatabaseReference newImageRef =
//             realtimeDatabase.ref("unitImages/$documentId").push();
//         await newImageRef.set({"imageBase64": base64Image});

//         imageKeys.add(newImageRef.key!);
//       }

//       // Save Unit Data in Firestore
//       await newDocRef.set({
//         "name": name,
//         "unitId": unitId,
//         "propertyId": propertyId,
//         "status": status,
//         "rentAmount": rentAmount,
//         "area": area,
//         "description": description,
//         "imageKeys": imageKeys,
//         "createdDate": DateTime.now().toIso8601String(),
//         "updatedDate": DateTime.now().toIso8601String(),
//       });

//       Get.snackbar("Success", "Unit added successfully.");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Function to Pick Images
//   Future<void> pickImages() async {
//     final ImagePicker picker = ImagePicker();
//     final List<XFile>? pickedFiles = await picker.pickMultiImage();

//     if (pickedFiles != null) {
//       selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
//     }
//   }
// }

import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class AddUnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

  RxList<File> selectedImages = <File>[].obs;
  RxBool isLoading = false.obs;

  // Add Unit Function
  Future<void> addUnit({
    required String name,
    required String unitId,
    required String propertyId,
    required String status,
    required String rentAmount,
    required String area,
    required String description,
  }) async {
    try {
      isLoading.value = true;

      // Generate a document ID for the Firestore document
      DocumentReference newDocRef = firestore.collection("All Units").doc();
      String documentId = newDocRef.id;

      // Upload images to Firebase Realtime Database
      List<String> imageKeys = [];
      for (var image in selectedImages) {
        String base64Image = base64Encode(await image.readAsBytes());

        DatabaseReference newImageRef =
            realtimeDatabase.ref("unitImages/$documentId").push();
        await newImageRef.set({"imageBase64": base64Image});

        imageKeys.add(newImageRef.key!);
      }

      // Save Unit Data in Firestore
      await newDocRef.set({
        "name": name,
        "unitId": unitId,
        "propertyId": propertyId,
        "status": status,
        "rentAmount": rentAmount,
        "area": area,
        "description": description,
        "imageKeys": imageKeys,
        "createdDate": DateTime.now().toIso8601String(),
        "updatedDate": DateTime.now().toIso8601String(),
      });

      Get.snackbar("Success", "Unit added successfully.");

      // Navigate to UnitsListScreen
      Get.offAllNamed('/units-list'); // Ensure this route is registered in GetX
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  // Function to Pick Images
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
    }
  }
}
