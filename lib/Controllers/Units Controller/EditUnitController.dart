// import 'dart:convert';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class EditUnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // Text Controllers
//   final TextEditingController unitNameController = TextEditingController();
//   final TextEditingController rentAmountController = TextEditingController();
//   final TextEditingController areaController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   // Observables
//   final RxList<File> selectedImages = <File>[].obs;
//   final RxList<String> existingImages = <String>[].obs;
//   final RxString availabilityStatus = "Status".obs;
//   final RxString unitType = "Unit Type".obs;

//   // Property and Unit IDs
//   late String propertyId;
//   late String unitId;

//   void initialize(String propertyId, String unitId) {
//     this.propertyId = propertyId;
//     this.unitId = unitId;
//     fetchUnitDetails();
//   }

//   void fetchUnitDetails() async {
//     try {
//       final doc = await firestore
//           .collection('All Properties')
//           .doc(propertyId)
//           .collection('Units')
//           .doc(unitId)
//           .get();

//       if (doc.exists) {
//         final data = doc.data()!;
//         unitNameController.text = data['unitName'] ?? '';
//         rentAmountController.text = data['rentAmount'] ?? '';
//         areaController.text = data['area'] ?? '';
//         descriptionController.text = data['description'] ?? '';
//         unitType.value = data['unitType'] ?? 'Unit Type';
//         availabilityStatus.value = data['status'] ?? 'Status';
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to load unit details: $e");
//     }
//   }

//   Future<void> updateUnitDetails() async {
//     try {
//       await firestore
//           .collection('All Properties')
//           .doc(propertyId)
//           .collection('Units')
//           .doc(unitId)
//           .update({
//         'unitName': unitNameController.text.trim(),
//         'unitType': unitType.value,
//         'rentAmount': rentAmountController.text.trim(),
//         'area': areaController.text.trim(),
//         'description': descriptionController.text.trim(),
//         'status': availabilityStatus.value,
//         'updatedDate': DateTime.now().toIso8601String(),
//       });

//       Get.snackbar("Success", "Unit updated successfully");
//       Get.back();
//     } catch (e) {
//       Get.snackbar("Error", "Failed to update unit:\nTry again later");
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitDetailsScreen.dart';

class EditUnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Text Controllers
  final TextEditingController unitNameController = TextEditingController();
  final TextEditingController rentAmountController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Observables
  final RxList<File> selectedImages = <File>[].obs;
  final RxList<String> existingImages = <String>[].obs;
  final RxString availabilityStatus = "Status".obs;
  final RxString unitType = "Unit Type".obs;
  final RxBool isLoading = false.obs;

  // Property and Unit IDs
  late String propertyId;
  late String unitId;
  late String unit;

  void initialize(String propertyId, String unitId) {
    this.propertyId = propertyId;
    this.unitId = unitId;
    fetchUnitDetails();
  }

  void fetchUnitDetails() async {
    try {
      final doc = await firestore
          .collection('All Properties')
          .doc(propertyId)
          .collection('Units')
          .doc(unitId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        unitNameController.text = data['unitName'] ?? '';
        rentAmountController.text = data['rentAmount'] ?? '';
        areaController.text = data['area'] ?? '';
        descriptionController.text = data['description'] ?? '';
        unitType.value = data['unitType'] ?? 'Unit Type';
        availabilityStatus.value = data['status'] ?? 'Status';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load unit details: $e");
    }
  }

  Future<void> updateUnitDetails() async {
    if (isLoading.value) return;

    isLoading.value = true;
    try {
      // Update the unit details in Firestore
      await firestore
          .collection('All Properties')
          .doc(propertyId)
          .collection('Units')
          .doc(unitId)
          .update({
        'unitName': unitNameController.text.trim(),
        'unitType': unitType.value,
        'rentAmount': rentAmountController.text.trim(),
        'area': areaController.text.trim(),
        'description': descriptionController.text.trim(),
        'status': availabilityStatus.value,
        'updatedDate': DateTime.now().toIso8601String(),
      });

      // Fetch the updated unit data
      final updatedUnitSnapshot = await firestore
          .collection('All Properties')
          .doc(propertyId)
          .collection('Units')
          .doc(unitId)
          .get();

      if (updatedUnitSnapshot.exists) {
        final updatedUnit = updatedUnitSnapshot.data();

        // Navigate to the UnitDetailsScreen with the updated unit data
        // Get.off(() => UnitDetailsScreen(
        //       propertyId: propertyId,
        //       unitId: unitId, unit: unit,
        //     ));
      } else {
        Get.snackbar("Error", "Failed to fetch updated unit data.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update unit:\nTry again later");
    } finally {
      isLoading.value = false;
    }
  }
}
