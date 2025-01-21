// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:get/get.dart';

// // class AddUnitController extends GetxController {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final FirebaseDatabase _realtimeDb = FirebaseDatabase.instance;

// //   var isLoading = false.obs;

// //   // Add unit to Firestore and images to Realtime Database
// //   Future<void> addUnit({
// //     required String name,
// //     required String unitId,
// //     required String propertyId,
// //     required String status,
// //     required String rentAmount,
// //     required String area,
// //     required String description,
// //     required List<File> images,
// //   }) async {
// //     try {
// //       isLoading.value = true;

// //       // Add unit to Firestore
// //       final docRef = await _firestore.collection('All Units').add({
// //         'name': name,
// //         'unitId': unitId,
// //         'propertyId': propertyId,
// //         'status': status,
// //         'rentAmount': rentAmount,
// //         'area': area,
// //         'description': description,
// //         'createdDate': DateTime.now().toIso8601String(),
// //         'updatedDate': DateTime.now().toIso8601String(),
// //       });

// //       // Add images to Realtime Database
// //       for (var image in images) {
// //         final imageBytes = await image.readAsBytes();
// //         final imageBase64 = base64Encode(imageBytes); // Convert to Base64
// //         await _realtimeDb
// //             .ref('units/${docRef.id}/images')
// //             .push()
// //             .set(imageBase64);
// //       }

// //       isLoading.value = false;
// //       Get.snackbar("Success", "Unit added successfully!");
// //     } catch (e) {
// //       isLoading.value = false;
// //       Get.snackbar("Error", "Failed to add unit: $e");
// //     }
// //   }
// // }

// // Step 1: Add Unit Model in GetX State Management

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'dart:io';

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
//       List<String> imageUrls = [];

//       // Generate a document ID in Firestore for referencing images
//       DocumentReference newDocRef = firestore.collection("All Units").doc();
//       String documentId = newDocRef.id;

//       // Upload images to Firebase Realtime Database
//       for (var image in selectedImages) {
//         String fileName = "image_${DateTime.now().millisecondsSinceEpoch}";
//         DatabaseReference newImageRef =
//             realtimeDatabase.ref("unitImages/$documentId/$fileName");
//         await newImageRef.set({"imageUrl": image.path}); // Save URL or path
//         imageUrls.add(newImageRef.key!);
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
//         "imageKeys": imageUrls,
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
    } catch (e) {
      Get.snackbar("Error", e.toString());
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
