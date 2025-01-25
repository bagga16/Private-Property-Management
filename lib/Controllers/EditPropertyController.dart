import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxBool isSubmitting = false.obs;

  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final RxString selectedPropertyType = ''.obs;
  final RxString selectedStatus = ''.obs;

  late String propertyId;

  // Load property data into fields for editing
  void loadPropertyData(Map<String, dynamic> propertyData) {
    propertyId = propertyData['id'];
    propertyNameController.text = propertyData['title'] ?? '';
    addressController.text = propertyData['address'] ?? '';
    cityController.text = propertyData['city'] ?? '';
    stateController.text = propertyData['state'] ?? '';
    zipController.text = propertyData['zip'] ?? '';
    countryController.text = propertyData['country'] ?? '';
    descriptionController.text = propertyData['description'] ?? '';
    selectedPropertyType.value = propertyData['type'] ?? 'Commercial';
    selectedStatus.value = propertyData['status'] ?? 'Active';
  }

  // Update Property Data
  Future<void> updateProperty() async {
    if (!_validateInputs()) {
      Get.snackbar("Error", "All fields must be filled.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isSubmitting.value = true;

      // Prepare updated property data
      Map<String, dynamic> updatedData = {
        'title': propertyNameController.text.trim(),
        'address': addressController.text.trim(),
        'city': cityController.text.trim(),
        'state': stateController.text.trim(),
        'zip': zipController.text.trim(),
        'country': countryController.text.trim(),
        'type': selectedPropertyType.value,
        'description': descriptionController.text.trim(),
        'updatedDate': DateTime.now().toIso8601String(),
        'status': selectedStatus.value,
      };

      // Update Firestore document
      await _firestore
          .collection('All Properties')
          .doc(propertyId)
          .update(updatedData);

      Get.snackbar("Success", "Property updated successfully.",
          snackPosition: SnackPosition.TOP);

      Get.offAllNamed('/property-screen'); // Redirect to properties screen
    } catch (e) {
      print("Error updating property: $e");
      Get.snackbar("Error", "Error updating property: $e",
          snackPosition: SnackPosition.TOP);
    } finally {
      isSubmitting.value = false;
    }
  }

  // Input validation
  bool _validateInputs() {
    return propertyNameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        zipController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }
}
