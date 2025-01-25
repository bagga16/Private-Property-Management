import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class AddWorkerController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Selected properties for the worker
  RxList<PropertyModel> selectedProperties = <PropertyModel>[].obs;

  // Add a new worker to Firestore
  Future<void> addWorker({
    required String workerId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String role,
  }) async {
    try {
      // Map all selected properties to JSON format
      List<Map<String, dynamic>> properties =
          selectedProperties.map((property) {
        return {
          "propertyId": property.id,
          "propertyName": property.title,
          "address": property.address,
          "type": property.type,
          "units": property.units,
          "description": property.description,
          "createdDate": property.createdDate,
          "updatedDate": property.updatedDate,
          "status": property.status,
          "imagePath": property.imagePath,
        };
      }).toList();

      final workerData = {
        "workerId": workerId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "role": role,
        "properties": properties, // Full property details
        "createdDate": DateTime.now().toIso8601String(),
        "updatedDate": "", // Initially empty, update later if necessary
      };

      await _firestore.collection('All Workers').add(workerData);
      Get.snackbar("Success", "Worker added successfully!");
      Get.offAllNamed('/worker-screen');
    } catch (e) {
      Get.snackbar("Error", "Failed to add worker: $e");
    }
  }

  // Add or remove a property from the selected list (max 3 properties)
  void toggleProperty(PropertyModel property) {
    if (selectedProperties.contains(property)) {
      selectedProperties.remove(property);
    } else {
      if (selectedProperties.length >= 3) {
        Get.snackbar(
          "Limit Reached",
          "You can assign up to 3 properties only.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        selectedProperties.add(property);
      }
    }
  }
}
