import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddPropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB =
      FirebaseDatabase.instance.ref().child('property_images');
  final Uuid uuid = const Uuid();

  final RxList<File> selectedImages =
      <File>[].obs; // Make selectedImages reactive
  final TextEditingController propertyIdController = TextEditingController();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController propertyTypeController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxString selectedPropertyType = 'Commercial'.obs;
  final RxString selectedStatus = 'Active'.obs;
  // Picking images
  Future<void> pickImages() async {
    try {
      final picker = ImagePicker();
      final List<XFile>? pickedFiles = await picker.pickMultiImage();
      if (pickedFiles != null) {
        selectedImages
            .addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  Future<void> addProperty() async {
    if (!_validateInputs()) {
      Get.snackbar("Error", "All fields must be filled.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      final String propertyId = uuid.v4();
      List<String> imageUrls = [];

      // Upload images to Realtime Database as Base64
      for (File image in selectedImages) {
        final imageBytes = await image.readAsBytes();
        final imageBase64 = base64Encode(imageBytes);
        await _realtimeDB.child(propertyId).push().set({'image': imageBase64});
        imageUrls.add(imageBase64);
      }

      // Save property data to Firestore
      Map<String, dynamic> propertyData = {
        'propertyId': propertyIdController.text.trim(),
        'title': propertyNameController.text.trim(),
        'id': propertyId,
        'address': addressController.text.trim(),
        'city': cityController.text.trim(),
        'state': stateController.text.trim(),
        'zip': zipController.text.trim(),
        'country': countryController.text.trim(),
        'type': selectedPropertyType.value, // Use selected type
        'units': int.tryParse(zipController.text) ?? 0,
        'description': descriptionController.text.trim(),
        'createdDate': DateTime.now().toIso8601String(),
        'updatedDate': DateTime.now().toIso8601String(),
        'status': selectedStatus.value, // Use selected status
        'imageUrls': imageUrls,
      };

      await _firestore
          .collection('All Properties')
          .doc(propertyId)
          .set(propertyData);

      Get.snackbar("Success", "Property added successfully.",
          snackPosition: SnackPosition.BOTTOM);

      clearInputs();
      Get.back(); // Navigate back to the previous screen
    } catch (e) {
      print("Error adding property: $e");
      Get.snackbar("Error", "Error adding property: $e",
          snackPosition: SnackPosition.BOTTOM);
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
        descriptionController.text.isNotEmpty &&
        selectedImages.isNotEmpty;
  }

  // Clearing inputs after successful submission
  void clearInputs() {
    propertyIdController.clear();
    propertyNameController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    zipController.clear();
    countryController.clear();
    propertyTypeController.clear();
    statusController.clear();
    descriptionController.clear();
    selectedImages.clear();
  }
}
