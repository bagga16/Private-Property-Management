import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddAnnouncementsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add Announcement to Firestore
  Future<void> addAnnouncement({
    required String propertyName,
    required String description,
  }) async {
    try {
      String date = DateFormat('dd/MM/yyyy').format(DateTime.now());

      // Add to Firestore
      await _firestore.collection('All Announcements').add({
        'propertyName': propertyName,
        'description': description,
        'date': date,
      });

      // Show success message
      Get.snackbar(
        "Success",
        "Announcement added successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate back after success
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to add announcement: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
