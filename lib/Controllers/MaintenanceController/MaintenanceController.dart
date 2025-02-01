import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
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
        return MaintenanceRequestModel.fromFirestore(
          doc.data() as Map<String, dynamic>,
        ).copyWith(id: doc.id);
      }).toList();
      filteredRequests.assignAll(maintenanceRequests);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch maintenance requests: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> fetchMaintenanceImage(String requestId) async {
    try {
      final snapshot = await realtimeDatabase
          .ref('maintenanceImages/$requestId/imageBase64')
          .get();
      if (snapshot.exists && snapshot.value != null) {
        return snapshot.value.toString();
      }
    } catch (e) {
      print("Error fetching maintenance image: $e");
    }
    return null;
  }

  Future<void> updateMaintenanceRequest(
      MaintenanceRequestModel updatedRequest) async {
    try {
      if (updatedRequest.id.isEmpty) {
        Get.snackbar("Error", "Invalid request ID. Cannot update.");
        return;
      }

      isLoading.value = true;

      String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

      updatedRequest = updatedRequest.copyWith(
        resolvedDate: updatedRequest.status == "Resolved"
            ? currentDate
            : updatedRequest.resolvedDate,
        updatedDate: currentDate,
      );

      await firestore
          .collection('Maintenance Requests')
          .doc(updatedRequest.id)
          .set(updatedRequest.toFirestore(), SetOptions(merge: true));

      // **✅ Store assigned request in Assigned Works collection**
      if (updatedRequest.assignedTo != null &&
          updatedRequest.assignedTo!.isNotEmpty) {
        QuerySnapshot workerSnapshot = await firestore
            .collection("All Workers")
            .where("name", isEqualTo: updatedRequest.assignedTo)
            .get();

        if (workerSnapshot.docs.isNotEmpty) {
          String workerId = workerSnapshot.docs.first.id;

          await firestore
              .collection("All Workers")
              .doc(workerId)
              .collection("Assigned Works")
              .doc(updatedRequest.id)
              .set(updatedRequest.toFirestore());
        }
      }

      Get.snackbar("Success", "Request updated successfully.");
    } catch (e) {
      Get.snackbar("Error", "Failed to update request: $e");
      print("Error::: Failed to update request: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> assignWorkToWorker(
      String workerName, MaintenanceRequestModel request) async {
    try {
      isLoading.value = true;

      // Find the worker's document from Firestore
      QuerySnapshot workersSnapshot = await firestore
          .collection('All Workers')
          .where("name", isEqualTo: workerName)
          .limit(1)
          .get();

      if (workersSnapshot.docs.isEmpty) {
        Get.snackbar("Error", "Worker not found in database");
        return;
      }

      // Get worker's document ID
      String workerId = workersSnapshot.docs.first.id;
      String workerIdPrefix = workerId.substring(0, 3); // First 3 digits

      // ✅ Store the assigned work under "Assigned Works" inside the worker's document
      await firestore
          .collection('All Workers')
          .doc(workerId)
          .collection('Assigned Works')
          .doc(request.id)
          .set(request.toFirestore());

      Get.snackbar("Success",
          "Work assigned to $workerName ($workerIdPrefix) successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to assign work: $e");
      print("Error::: Failed to assign work: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // /// ✅ Assigns Maintenance Request to Worker
  // Future<void> assignWorkToWorker(
  //     String workerName, MaintenanceRequestModel request) async {
  //   try {
  //     isLoading.value = true;

  //     // Find the worker's document from Firestore
  //     QuerySnapshot workersSnapshot = await firestore
  //         .collection('All Workers')
  //         .where("name", isEqualTo: workerName)
  //         .limit(1)
  //         .get();

  //     if (workersSnapshot.docs.isEmpty) {
  //       Get.snackbar("Error", "Worker not found in database");
  //       return;
  //     }

  //     String workerId =
  //         workersSnapshot.docs.first.id; // Get worker's document ID

  //     // ✅ Store the assigned work under "Assigned Works" inside the worker's document
  //     await firestore
  //         .collection('All Workers')
  //         .doc(workerId)
  //         .collection('Assigned Works')
  //         .doc(request.id) // Store using request ID
  //         .set(request.toFirestore());

  //     Get.snackbar("Success", "Work assigned to $workerName successfully!");
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to assign work: $e");
  //     print("Error::: Failed to assign work: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // // /// **Update Maintenance Request**
  // Future<void> updateMaintenanceRequest(
  //     MaintenanceRequestModel updatedRequest) async {
  //   try {
  //     if (updatedRequest.id.isEmpty) {
  //       Get.snackbar("Error", "Invalid request ID. Cannot update.");
  //       return;
  //     }

  //     isLoading.value = true;

  //     /// ✅ **Get Current Date in `dd/MM/yyyy` format**
  //     String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  //     /// ✅ **Set Updated Date whenever any change happens**
  //     updatedRequest = updatedRequest.copyWith(
  //       resolvedDate: updatedRequest.status == "Resolved"
  //           ? currentDate
  //           : updatedRequest
  //               .resolvedDate, // ✅ Set Resolved Date if status is "Resolved"
  //       updatedDate: currentDate, // ✅ Always update when request is modified
  //     );

  //     await firestore
  //         .collection('Maintenance Requests')
  //         .doc(updatedRequest.id)
  //         .set(updatedRequest.toFirestore(), SetOptions(merge: true));

  //     Get.snackbar("Success", "Request updated successfully.");
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to update request: $e");
  //     print("Error::: Failed to update request: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // // Apply filter for Priority Status
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
          return false;
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


// // ////////////////

// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:intl/intl.dart';
// import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

// class MaintenanceController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;
//   var filteredRequests = <MaintenanceRequestModel>[].obs;

//   var isLoading = true.obs;
//   var maintenanceRequests = <MaintenanceRequestModel>[].obs;

//   var selectedTabIndex = 0.obs;
//   final List<String> tabs = [
//     " All ",
//     "Priority Status",
//     "Progress Status",
//     "Assigned to",
//     "Requested Date Range"
//   ];

//   Future<void> fetchMaintenanceRequests() async {
//     try {
//       isLoading.value = true;
//       QuerySnapshot snapshot =
//           await firestore.collection('Maintenance Requests').get();

//       maintenanceRequests.value = snapshot.docs.map((doc) {
//         return MaintenanceRequestModel.fromFirestore(
//           doc.data() as Map<String, dynamic>,
//         ).copyWith(id: doc.id); // Set the document ID
//       }).toList();
//       filteredRequests.assignAll(maintenanceRequests);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch maintenance requests: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<String?> fetchMaintenanceImage(String requestId) async {
//     try {
//       final snapshot = await realtimeDatabase
//           .ref('maintenanceImages/$requestId/imageBase64')
//           .get();
//       if (snapshot.exists && snapshot.value != null) {
//         return snapshot.value.toString();
//       }
//     } catch (e) {
//       print("Error fetching maintenance image: $e");
//     }
//     return null;
//   }

//   /// **Update Maintenance Request**
//   Future<void> updateMaintenanceRequest(
//       MaintenanceRequestModel updatedRequest) async {
//     try {
//       if (updatedRequest.id.isEmpty) {
//         Get.snackbar("Error", "Invalid request ID. Cannot update.");
//         return;
//       }

//       isLoading.value = true;

//       /// ✅ **Get Current Date in `dd/MM/yyyy` format**
//       String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

//       /// ✅ **Set Updated Date (Whenever any change happens)**
//       updatedRequest = updatedRequest.copyWith(
//         resolvedDate: updatedRequest.status == "Resolved"
//             ? currentDate
//             : updatedRequest
//                 .resolvedDate, // Set Resolved Date only if status is "Resolved"
//         requestedDate: currentDate, // Update every time request is modified
//       );

//       await firestore
//           .collection('Maintenance Requests')
//           .doc(updatedRequest.id)
//           .set(updatedRequest.toFirestore(), SetOptions(merge: true));

//       Get.snackbar("Success", "Request updated successfully.");
//     } catch (e) {
//       Get.snackbar("Error", "Failed to update request: $e");
//       print("Error::: Failed to update request: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Apply filter for Priority Status
//   void applyPriorityFilter(String priority) {
//     filteredRequests.assignAll(
//       maintenanceRequests.where((request) => request.priority == priority),
//     );
//   }

//   // Apply filter for Progress Status
//   void applyProgressFilter(String progressStatus) {
//     filteredRequests.assignAll(
//       maintenanceRequests.where((request) => request.status == progressStatus),
//     );
//   }

//   // Apply filter for Assigned To
//   void applyAssignedToFilter(String assignedTo) {
//     filteredRequests.assignAll(
//       maintenanceRequests.where((request) => request.assignedTo == assignedTo),
//     );
//   }

//   void applyDateRangeFilter(DateTime from, DateTime to) {
//     filteredRequests.assignAll(
//       maintenanceRequests.where((request) {
//         try {
//           DateTime requestDate =
//               DateFormat('dd/MM/yyyy').parse(request.requestedDate);
//           return requestDate.isAtSameMomentAs(from) ||
//               requestDate.isAtSameMomentAs(to) ||
//               (requestDate.isAfter(from) && requestDate.isBefore(to));
//         } catch (e) {
//           print("Error parsing requestedDate for request ID ${request.id}: $e");
//           return false;
//         }
//       }),
//     );
//   }

//   // Clear all filters (Tab 1 - All)
//   void clearFilters() {
//     filteredRequests.assignAll(maintenanceRequests);
//   }

//   // Update selected tab index
//   void updateSelectedTabIndex(int index) {
//     selectedTabIndex.value = index;

//     if (index == 0) {
//       clearFilters();
//     }
//   }

//   void searchRequests(String query) {
//     filteredRequests.value = filteredRequests
//         .where(
//             (Request) => Request.id.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }
