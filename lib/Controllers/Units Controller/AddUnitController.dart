// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

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

//       // Navigate to UnitsListScreen
//       Get.offAllNamed('/units-list'); // Ensure this route is registered in GetX
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//       print("Error: ${e.toString()}");
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

// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:uuid/uuid.dart';

// // class AddUnitController extends GetxController {
// //   // Text Controllers
// //   final TextEditingController unitNameController = TextEditingController();
// //   final TextEditingController rentAmountController = TextEditingController();
// //   final TextEditingController areaController = TextEditingController();
// //   final TextEditingController descriptionController = TextEditingController();

// //   // Dropdown and status handling
// //   RxString selectedUnitType = 'Studio'.obs;
// //   RxString selectedStatus = 'Vacant'.obs;

// //   // Unit type and status options
// //   final List<String> unitTypes = ['Studio', '1BR', '2BR', 'Office'];
// //   final List<String> statusOptions = [
// //     'Vacant',
// //     'Occupied',
// //     'Under Maintenance'
// //   ];

// //   // Images
// //   RxList<XFile> selectedImages = <XFile>[].obs;

// //   final FirebaseFirestore firestore = FirebaseFirestore.instance;

// //   // Pick Images using ImagePicker
// //   Future<void> pickImages() async {
// //     try {
// //       final ImagePicker picker = ImagePicker();
// //       final List<XFile>? pickedFiles = await picker.pickMultiImage();

// //       if (pickedFiles != null && pickedFiles.isNotEmpty) {
// //         selectedImages.addAll(pickedFiles);
// //       }
// //     } catch (e) {
// //       Get.snackbar("Error", "Failed to pick images: $e");
// //     }
// //   }

// //   // Add Unit to Firestore
// //   Future<void> addUnit({required String propertyId}) async {
// //     try {
// //       if (!_validateInputs()) {
// //         Get.snackbar("Error", "All fields must be filled!");
// //         return;
// //       }

// //       // Generate unique unit ID
// //       String unitId = const Uuid().v4();

// //       // Upload images to Firestore
// //       List<String> imageUrls = [];
// //       for (var image in selectedImages) {
// //         // Convert image to Base64 and upload
// //         File file = File(image.path);
// //         String base64Image =
// //             await file.readAsBytes().then((bytes) => base64Encode(bytes));

// //         // Save to Firebase (example using a "unitImages" collection or Realtime Database)
// //         await FirebaseFirestore.instance
// //             .collection('unitImages')
// //             .doc(unitId)
// //             .set({'imageBase64': base64Image});
// //         imageUrls.add(base64Image);
// //       }

// //       // Prepare unit data
// //       Map<String, dynamic> unitData = {
// //         "propertyId": propertyId,
// //         "unitName": unitNameController.text.trim(),
// //         "unitType": selectedUnitType.value,
// //         "rentAmount": rentAmountController.text.trim(),
// //         "area": areaController.text.trim(),
// //         "description": descriptionController.text.trim(),
// //         "status": selectedStatus.value,
// //         "createdDate": DateTime.now().toIso8601String(),
// //         "updatedDate": DateTime.now().toIso8601String(),
// //         "images": imageUrls,
// //       };

// //       // Add unit to Firestore
// //       await firestore.collection("All Units").doc(unitId).set(unitData);

// //       // Show success message and clear inputs
// //       Get.snackbar("Success", "Unit added successfully!");
// //       _clearInputs();
// //     } catch (e) {
// //       Get.snackbar("Error", "Failed to add unit: $e");
// //       print("Error::::::::Failed to add unit: $e");
// //     }
// //   }

// //   // Validate form inputs
// //   bool _validateInputs() {
// //     return unitNameController.text.isNotEmpty &&
// //         rentAmountController.text.isNotEmpty &&
// //         areaController.text.isNotEmpty &&
// //         descriptionController.text.isNotEmpty &&
// //         selectedImages.isNotEmpty;
// //   }

// //   // Clear inputs after successful addition
// //   void _clearInputs() {
// //     unitNameController.clear();
// //     rentAmountController.clear();
// //     areaController.clear();
// //     descriptionController.clear();
// //     selectedImages.clear();
// //     selectedUnitType.value = 'Studio';
// //     selectedStatus.value = 'Vacant';
// //   }
// // }

//##############33

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitsListScreen.dart';
import 'package:uuid/uuid.dart';

class AddUnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DatabaseReference realtimeDB =
      FirebaseDatabase.instance.ref().child('unit_images');

  final TextEditingController unitNameController = TextEditingController();
  final TextEditingController unitTypeController = TextEditingController();
  final TextEditingController rentAmountController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxList<File> selectedImages = <File>[].obs;
  RxString availabilityStatus = "Status".obs;
  RxString unitType = "Unit Type".obs;

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
    }
  }

  Future<void> addUnit(String propertyId) async {
    if (unitNameController.text.isEmpty ||
        rentAmountController.text.isEmpty ||
        areaController.text.isEmpty ||
        selectedImages.isEmpty) {
      Get.snackbar("Error", "All fields must be filled");
      return;
    }
    if (unitType.value == "Unit Type" || availabilityStatus.value == "Status") {
      Get.snackbar("Error", "Please select valid Unit Type and Status");
      return;
    }

    try {
      String unitId = Uuid().v4();
      List<String> imagePaths = [];

      // Upload images to Realtime Database
      for (File image in selectedImages) {
        final imageBytes = await image.readAsBytes();
        final imageBase64 = base64Encode(imageBytes);
        await realtimeDB.child(unitId).push().set({'imageBase64': imageBase64});
        imagePaths.add(imageBase64);
      }

      // Save unit data to Firestore
      await firestore
          .collection('All Properties')
          .doc(propertyId)
          .collection('Units')
          .doc(unitId)
          .set({
        'unitId': unitId,
        'propertyId': propertyId,
        'unitName': unitNameController.text.trim(),
        'unitType': unitType.value,
        'rentAmount': rentAmountController.text.trim(),
        'area': areaController.text,
        'description': descriptionController.text.trim(),
        'status': availabilityStatus.value,
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
        'images': imagePaths,
      });

      Get.snackbar("Success", "Unit added successfully");
      clearInputs();
      Get.off(UnitsListScreen(propertyId: propertyId));
    } catch (e) {
      print("Error:::::: Failed to add unit: $e");

      Get.snackbar("Error", "Failed to add unit:\nTry again later");
    }
  }

  void clearInputs() {
    unitNameController.clear();
    unitTypeController.clear();
    rentAmountController.clear();
    areaController.clear();
    descriptionController.clear();
    selectedImages.clear();
  }
}
