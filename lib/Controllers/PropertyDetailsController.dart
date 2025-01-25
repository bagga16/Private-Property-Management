import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/UnitModel.dart';

class PropertyDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String propertyId;

  PropertyDetailsController({required this.propertyId});

  // Observable to store the total number of units
  RxInt totalUnits = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTotalUnits();
  }

  // Fetch total units for the property

  Future<void> fetchTotalUnits() async {
    try {
      // Access the nested "Units" collection inside the specific property
      final snapshot = await _firestore
          .collection('All Properties') // Main collection
          .doc(propertyId) // Document ID of the specific property
          .collection('Units') // Nested "Units" collection
          .get();

      // Update the totalUnits observable with the number of documents in the snapshot
      totalUnits.value = snapshot.docs.length;
    } catch (e) {
      debugPrint("Error fetching units for property $propertyId: $e");
    }
  }
}
