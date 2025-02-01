// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart'; // Import for custom date format parsing

// class PaymentsController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   RxList<Map<String, dynamic>> payments =
//       <Map<String, dynamic>>[].obs; // Payment list
//   RxBool isLoading = true.obs; // Loading state
//   RxInt selectedTabIndex = 0.obs; // Selected tab index
//   RxList<Map<String, dynamic>> filteredPayments =
//       <Map<String, dynamic>>[].obs; // Filtered payments

//   final List<String> tabs = [
//     "All Payments",
//     "Paid Payment",
//     "Due Payments",
//     "Date Range",
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPayments();
//   }

//   /// Fetch payments from Firestore
//   Future<void> fetchPayments() async {
//     try {
//       isLoading.value = true;

//       // Fetch tenants from Firestore
//       QuerySnapshot snapshot = await _firestore.collection('All Tenants').get();

//       payments.value = snapshot.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;

//         // Calculate days remaining or overdue
//         final leaseEnd =
//             data['leaseEnd']?.toString(); // Lease end date as String
//         final daysInfo = calculateDaysInfo(leaseEnd);

//         return {
//           "name": data['name'] ?? "N/A",
//           "rent": "\$${data['rent'] ?? "0"}",
//           "statusType": getStatusType(data['paymentStatus'], daysInfo['days']),
//           "status": getStatusText(data['paymentStatus'], daysInfo['days']),
//           "statusColor":
//               getStatusColor(data['paymentStatus'], daysInfo['days']),
//           "daysRemaining": daysInfo['days'], // Add daysRemaining
//           "isDue": data['paymentStatus'] != "Paid",
//           "unit": data['unitId'] ?? "N/A",
//           "updated": formatDate1(data['updatedDate']),
//           "tenantStatus": data['status'] ?? "Unknown",
//         };
//       }).toList();

//       // Apply default filter (All Payments)
//       applyFilter(0);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch payments: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   /// Calculate remaining or overdue days
//   Map<String, dynamic> calculateDaysInfo(String? leaseEnd) {
//     if (leaseEnd == null || leaseEnd.isEmpty) {
//       return {"days": null, "status": "Invalid Date"};
//     }

//     try {
//       final now = DateTime.now();
//       final leaseEndDate =
//           DateFormat('dd/MM/yyyy').parse(leaseEnd); // Parse dd/MM/yyyy
//       final difference = leaseEndDate.difference(now).inDays;

//       if (difference >= 0) {
//         return {"days": difference, "status": "Due"};
//       } else {
//         return {"days": difference.abs(), "status": "Overdue"};
//       }
//     } catch (e) {
//       print("Error parsing leaseEnd date: $leaseEnd");
//       return {"days": null, "status": "Invalid Date"};
//     }
//   }

//   /// Helpers to derive status properties
//   String getStatusType(String? status, int? days) {
//     if (status == "Paid") return "paid";
//     if (days != null && days < 0) return "overdue";
//     return "due";
//   }

//   String getStatusText(String? status, int? days) {
//     if (status == "Paid") return "Paid";
//     if (days != null && days < 0) return "Overdue (${days.abs()} Days)";
//     if (days != null) return "Due in (${days} Days)";
//     return "Due";
//   }

//   Color getStatusColor(String? status, int? days) {
//     if (status == "Paid") return const Color(0xFF8BC83F);
//     if (days != null && days < 0)
//       return const Color(0xFFDF1525); // Red for overdue
//     return const Color(0xFF8BC83F); // Green for due
//   }

//   String formatDate(String? date) {
//     if (date == null || date.isEmpty) return "N/A";
//     try {
//       final parsedDate = DateFormat('dd/MM/yyyy').parse(date);
//       return '${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year}';
//     } catch (e) {
//       return "Invalid Date";
//     }
//   }

//   String formatDate1(String date) {
//     final dateTime = DateTime.parse(date);
//     return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
//   }

//   /// Apply filtering logic
//   void applyFilter(int tabIndex) {
//     selectedTabIndex.value = tabIndex;

//     if (tabIndex == 0) {
//       filteredPayments.value = payments;
//     } else if (tabIndex == 1) {
//       filteredPayments.value =
//           payments.where((payment) => payment['statusType'] == 'paid').toList();
//     } else if (tabIndex == 2) {
//       filteredPayments.value = payments
//           .where((payment) =>
//               payment['statusType'] == 'overdue' ||
//               payment['statusType'] == 'due')
//           .toList();
//     } else {
//       filteredPayments.value = payments; // Placeholder for Date Range
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> payments = <Map<String, dynamic>>[].obs;
  RxBool isLoading = true.obs;
  RxInt selectedTabIndex = 0.obs;
  RxList<Map<String, dynamic>> filteredPayments = <Map<String, dynamic>>[].obs;

  final List<String> tabs = [
    "All Payments",
    "Paid Payments",
    "Due Payments",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchPayments();
  }

  /// **Fetch all payments from Firestore ("All Payments" collection)**
  Future<void> fetchPayments() async {
    try {
      isLoading.value = true;

      QuerySnapshot snapshot =
          await _firestore.collection('All Payments').get();

      payments.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          "paymentId": data['paymentId'] ?? "N/A",
          "userId": data['userId'] ?? "N/A",
          "userName": data['userName'] ?? "N/A",
          "unitName": data['unitName'] ?? "N/A",
          "amount": "\$${data['amount'] ?? "0.00"}",
          "status": data['status'] ?? "Due",
          "statusColor": data['status'] == "Paid" ? Colors.green : Colors.red,
          "dueDate": formatDate(data['dueDate']),
          "updatedDate": formatDate(data['updatedDate']),
        };
      }).toList();

      applyFilter(0); // Show all payments initially
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch payments: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// **Format date to `dd/MM/yyyy`**
  String formatDate(String? date) {
    if (date == null || date.isEmpty) return "N/A";
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return "Invalid Date";
    }
  }

  /// **Apply filtering based on tab selection**
  void applyFilter(int tabIndex) {
    selectedTabIndex.value = tabIndex;

    if (tabIndex == 0) {
      filteredPayments.value = payments;
    } else if (tabIndex == 1) {
      filteredPayments.value =
          payments.where((payment) => payment['status'] == 'Paid').toList();
    } else if (tabIndex == 2) {
      filteredPayments.value =
          payments.where((payment) => payment['status'] == 'Due').toList();
    }
  }
}
