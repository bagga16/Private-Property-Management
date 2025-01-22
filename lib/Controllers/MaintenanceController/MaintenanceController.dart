import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

class MaintenanceController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;
  var filteredRequests = <MaintenanceRequestModel>[].obs;

  var isLoading = true.obs;
  var maintenanceRequests = <MaintenanceRequestModel>[].obs;

  var selectedTabIndex = 0.obs;
  final List<String> tabs = [
    " All ",
    "Priority Status",
    "Progress Status",
    "Assigned to",
    "Requested Date Range"
  ];

  Future<void> fetchMaintenanceRequests() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot =
          await firestore.collection('Maintenance Requests').get();

      maintenanceRequests.value = snapshot.docs.map((doc) {
        // Include the Firestore document ID
        return MaintenanceRequestModel.fromFirestore(
          doc.data() as Map<String, dynamic>,
        ).copyWith(id: doc.id); // Set the document ID
      }).toList();
      // Initially, show all requests
      filteredRequests.assignAll(maintenanceRequests);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch maintenance requests: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // // Fetch images for a specific request
  Future<List<String>> fetchImages(String requestId) async {
    try {
      final DataSnapshot snapshot =
          await realtimeDatabase.ref('maintenanceImages/$requestId').get();
      if (snapshot.value != null) {
        Map<dynamic, dynamic> images = snapshot.value as Map<dynamic, dynamic>;
        return images.values
            .map((value) => value['imageBase64'] as String)
            .toList();
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
    return [];
  }

  Future<void> updateMaintenanceRequest(
      MaintenanceRequestModel updatedRequest) async {
    try {
      // Validate that the ID is not empty
      if (updatedRequest.id.isEmpty) {
        Get.snackbar("Error", "Invalid request ID. Cannot update.");
        return;
      }

      isLoading.value = true;

      // Update Firestore document using the document ID
      await firestore
          .collection('Maintenance Requests')
          .doc(updatedRequest.id) // Use document ID
          .set(updatedRequest.toFirestore());

      Get.snackbar("Success", "Request updated successfully.");
    } catch (e) {
      Get.snackbar("Error", "Failed to update request: $e");
      print("Error::: Failed to update request: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Apply filter for Priority Status
  void applyPriorityFilter(String priority) {
    filteredRequests.assignAll(
      maintenanceRequests.where((request) => request.priority == priority),
    );
  }

  // Apply filter for Progress Status
  void applyProgressFilter(String progressStatus) {
    filteredRequests.assignAll(
      maintenanceRequests.where((request) => request.status == progressStatus),
    );
  }

  // Apply filter for Assigned To
  void applyAssignedToFilter(String assignedTo) {
    filteredRequests.assignAll(
      maintenanceRequests.where((request) => request.assignedTo == assignedTo),
    );
  }

  void applyDateRangeFilter(DateTime from, DateTime to) {
    filteredRequests.assignAll(
      maintenanceRequests.where((request) {
        try {
          DateTime requestDate =
              DateFormat('dd/MM/yyyy').parse(request.requestedDate);
          return requestDate.isAtSameMomentAs(from) ||
              requestDate.isAtSameMomentAs(to) ||
              (requestDate.isAfter(from) && requestDate.isBefore(to));
        } catch (e) {
          print("Error parsing requestedDate for request ID ${request.id}: $e");
          return false; // Skip invalid dates
        }
      }),
    );
  }

  // Clear all filters (Tab 1 - All)
  void clearFilters() {
    filteredRequests.assignAll(maintenanceRequests);
  }

  // Update selected tab index
  void updateSelectedTabIndex(int index) {
    selectedTabIndex.value = index;

    if (index == 0) {
      clearFilters();
    }
  }

  void searchRequests(String query) {
    filteredRequests.value = filteredRequests
        .where(
            (Request) => Request.id.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
