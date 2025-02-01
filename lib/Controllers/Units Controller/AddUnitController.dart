// import 'dart:convert';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:private_property_management/App%20Screen/Proprties/Units/UnitsListScreen.dart';
// import 'package:uuid/uuid.dart';

// class AddUnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final DatabaseReference realtimeDB =
//       FirebaseDatabase.instance.ref().child('unit_images');

//   final TextEditingController unitNameController = TextEditingController();
//   final TextEditingController unitTypeController = TextEditingController();
//   final TextEditingController rentAmountController = TextEditingController();
//   final TextEditingController areaController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   RxList<File> selectedImages = <File>[].obs;
//   RxString availabilityStatus = "Status".obs;
//   RxString unitType = "Unit Type".obs;

//   Future<void> pickImages() async {
//     final picker = ImagePicker();
//     final List<XFile>? pickedFiles = await picker.pickMultiImage();
//     if (pickedFiles != null) {
//       selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
//     }
//   }

//   Future<void> addUnit(String propertyId) async {
//     if (unitNameController.text.isEmpty ||
//         rentAmountController.text.isEmpty ||
//         areaController.text.isEmpty ||
//         selectedImages.isEmpty) {
//       Get.snackbar("Error", "All fields must be filled");
//       return;
//     }
//     if (unitType.value == "Unit Type" || availabilityStatus.value == "Status") {
//       Get.snackbar("Error", "Please select valid Unit Type and Status");
//       return;
//     }

// try {
//   String unitId = Uuid().v4();
//   List<String> imagePaths = [];

//   // Upload images to Realtime Database
//   for (File image in selectedImages) {
//     final imageBytes = await image.readAsBytes();
//     final imageBase64 = base64Encode(imageBytes);
//     await realtimeDB.child(unitId).push().set({'imageBase64': imageBase64});
//     imagePaths.add(imageBase64);
//   }

//       // Save unit data to Firestore
//       await firestore
//           .collection('All Properties')
//           .doc(propertyId)
//           .collection('Units')
//           .doc(unitId)
//           .set({
//         'unitId': unitId,
//         'propertyId': propertyId,
//         'unitName': unitNameController.text.trim(),
//         'unitType': unitType.value,
//         'rentAmount': rentAmountController.text.trim(),
//         'area': areaController.text,
//         'description': descriptionController.text.trim(),
//         'status': availabilityStatus.value,
//         'createdDate': DateTime.now().toIso8601String(),
//         'updatedDate': DateTime.now().toIso8601String(),
//         'images': imagePaths,
//       });

//       Get.snackbar("Success", "Unit added successfully");
//       clearInputs();
//       Get.off(UnitsListScreen(propertyId: propertyId));
//     } catch (e) {
//       print("Error:::::: Failed to add unit: $e");

//       Get.snackbar("Error", "Failed to add unit:\nTry again later");
//     }
//   }

//   void clearInputs() {
//     unitNameController.clear();
//     unitTypeController.clear();
//     rentAmountController.clear();
//     areaController.clear();
//     descriptionController.clear();
//     selectedImages.clear();
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitsListScreen.dart';
import 'package:uuid/uuid.dart';

class AddUnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DatabaseReference realtimeDB =
      FirebaseDatabase.instance.ref().child('unit_data');

  // Controllers
  final TextEditingController unitNameController = TextEditingController();
  final TextEditingController rentAmountController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController leaseStartController = TextEditingController();
  final TextEditingController leaseEndController = TextEditingController();
  final TextEditingController depositAmountController = TextEditingController();

  // State Variables
  RxList<File> selectedImages = <File>[].obs;
  RxList<File> selectedDocuments = <File>[].obs;
  RxString availabilityStatus = "Status".obs;
  RxString unitType = "Unit Type".obs;
  RxBool isLoading = false.obs;

  /// **Pick Multiple Images**
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      selectedImages.addAll(pickedFiles.map((file) => File(file.path)));
    }
  }

  /// **Pick Lease Documents (PDF)**
  Future<void> pickDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      selectedDocuments.addAll(result.paths.map((path) => File(path!)));
      Get.snackbar(
          'Files Selected', '${selectedDocuments.length} file(s) selected.');
    } else {
      Get.snackbar('No Files Selected', 'Please select at least one document.');
    }
  }

  /// **Pick Lease Date**
  Future<void> pickLeaseDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    } else {
      Get.snackbar('Cancelled', 'No date selected');
    }
  }

  /// **Upload Files (Images & Documents) to Firebase Realtime Database**
  Future<List<String>> _uploadFiles(
      List<File> files, String unitId, String type) async {
    List<String> fileKeys = [];
    for (File file in files) {
      final fileBytes = await file.readAsBytes();
      final fileBase64 = base64Encode(fileBytes);
      DatabaseReference fileRef = realtimeDB.child(unitId).child(type).push();
      await fileRef.set({'fileBase64': fileBase64});
      fileKeys.add(fileRef.key!);
    }
    return fileKeys;
  }

  /// **Add Unit to Firebase**
  Future<void> addUnit(String propertyId) async {
    if (unitNameController.text.isEmpty ||
        rentAmountController.text.isEmpty ||
        areaController.text.isEmpty ||
        selectedImages.isEmpty) {
      Get.snackbar("Error", "All required fields must be filled.");
      return;
    }

    if (unitType.value == "Unit Type" || availabilityStatus.value == "Status") {
      Get.snackbar("Error", "Please select a valid Unit Type and Status.");
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
      isLoading.value = true;

      // Upload Images & Documents to Firebase Realtime Database
      List<String> imageKeys =
          await _uploadFiles(selectedImages, unitId, 'images');
      List<String> documentKeys =
          await _uploadFiles(selectedDocuments, unitId, 'documents');

      // Save Unit Data to Firestore
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
        'area': areaController.text.trim(),
        'description': descriptionController.text.trim(),
        'status': availabilityStatus.value,
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
        'leaseStartDate': leaseStartController.text.isNotEmpty
            ? leaseStartController.text
            : null,
        'leaseEndDate':
            leaseEndController.text.isNotEmpty ? leaseEndController.text : null,
        'depositAmount': depositAmountController.text.isNotEmpty
            ? depositAmountController.text.trim()
            : null,
        'imageRefs': imageKeys,
        'documentRefs': documentKeys,
      });

      Get.snackbar("Success", "Unit added successfully.");
      clearInputs();
      Get.off(UnitsListScreen(propertyId: propertyId));
    } catch (e) {
      Get.snackbar("Error", "Failed to add unit. Try again later.");
    } finally {
      isLoading.value = false;
    }
  }

  /// **Clear All Inputs**
  void clearInputs() {
    unitNameController.clear();
    rentAmountController.clear();
    areaController.clear();
    descriptionController.clear();
    leaseStartController.clear();
    leaseEndController.clear();
    depositAmountController.clear();
    selectedImages.clear();
    selectedDocuments.clear();
  }
}
