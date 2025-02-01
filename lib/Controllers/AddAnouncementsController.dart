import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAnnouncementsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observables
  RxList<String> propertyNames = <String>[].obs;
  RxString selectedProperty = ''.obs;
  RxBool isLoading = false.obs; // Observable to track loading state

  @override
  void onInit() {
    super.onInit();
    fetchProperties(); // Fetch properties when the controller initializes
  }

  // Fetch all properties from Firestore
  Future<void> fetchProperties() async {
    try {
      final snapshot = await _firestore.collection('All Properties').get();
      propertyNames.clear(); // Clear existing property names
      for (var doc in snapshot.docs) {
        final propertyName = doc['title'] ?? '';
        if (propertyName.isNotEmpty) {
          propertyNames.add(propertyName);
        }
      }
      if (propertyNames.isNotEmpty) {
        selectedProperty.value = propertyNames.first; // Set default selection
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to fetch properties: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Add Announcement to Firestore
  Future<void> addAnnouncement({
    required String description,
  }) async {
    try {
      isLoading.value = true; // Start loading
      String date =
          DateTime.now().toString().split(' ')[0]; // Format as yyyy-MM-dd

      // Add to Firestore
      await _firestore.collection('All Announcements').add({
        'propertyName': selectedProperty.value,
        'description': description,
        'date': date,
      });

      // Show success message
      Get.snackbar(
        "Success",
        "Announcement added successfully!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to Announcements screen
      Get.offNamed(
          '/announcements-screen'); // Replace with your Announcements screen route
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add announcement: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
