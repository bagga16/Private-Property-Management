import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class EditWorkerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Text editing controllers for fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Role and selected properties
  RxString selectedRole = ''.obs;
  RxList<PropertyModel> selectedProperties = <PropertyModel>[].obs;

  // Worker document ID for Firestore updates
  late String workerDocumentId;

  // Load existing worker data into controllers
  void loadWorkerData(String documentId, Map<String, dynamic> workerData) {
    workerDocumentId = documentId;

    // Set initial field values
    firstNameController.text = workerData['firstName'] ?? '';
    lastNameController.text = workerData['lastName'] ?? '';
    emailController.text = workerData['email'] ?? '';
    phoneController.text = workerData['phone'] ?? '';
    selectedRole.value = workerData['role'] ?? 'Worker';
  }

  // Update worker information in Firestore
  Future<void> updateWorker() async {
    if (!_validateInputs()) {
      Get.snackbar("Error", "All fields must be filled.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      final updatedData = {
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'role': selectedRole.value,
        'updatedDate': DateTime.now().toIso8601String(),
      };

      await _firestore
          .collection('All Workers')
          .doc(workerDocumentId)
          .update(updatedData);

      Get.snackbar("Success", "Worker updated successfully.",
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('/worker-screen'); // Navigate back to worker list
    } catch (e) {
      Get.snackbar("Error", "Failed to update worker: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Validate that all fields are filled
  bool _validateInputs() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedRole.value.isNotEmpty;
  }

  @override
  void onClose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
