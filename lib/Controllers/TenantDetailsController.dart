// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

// class TenantDetailsController extends GetxController {
//   final String tenantDocId; // Firestore document ID
//   RxBool isLoading = true.obs;
//   RxMap<String, dynamic> tenantDetails = <String, dynamic>{}.obs;
//   RxList<Map<String, String>> leaseDocuments = <Map<String, String>>[].obs;

//   TenantDetailsController(this.tenantDocId);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTenantDetails(); // Fetch tenant details on initialization
//   }

//   /// Fetch tenant details and associated documents
//   Future<void> fetchTenantDetails() async {
//     try {
//       isLoading(true); // Start loading

//       // Clear existing data to avoid showing stale data
//       tenantDetails.clear();
//       leaseDocuments.clear();

//       // Fetch tenant details from Firestore using the document ID
//       final firestoreDoc = await FirebaseFirestore.instance
//           .collection('All Tenants')
//           .doc(tenantDocId)
//           .get();

//       if (firestoreDoc.exists) {
//         tenantDetails.assignAll(firestoreDoc.data() as Map<String, dynamic>);
//       } else {
//         throw Exception("Tenant not found in Firestore");
//       }

//       // Fetch lease documents from Realtime Database for this specific tenant
//       final leaseDocsRef =
//           FirebaseDatabase.instance.ref('tenants/$tenantDocId/lease_documents');
//       final leaseDocsSnapshot = await leaseDocsRef.get();

//       if (leaseDocsSnapshot.exists) {
//         Map<dynamic, dynamic> docs =
//             leaseDocsSnapshot.value as Map<dynamic, dynamic>;
//         docs.forEach((key, value) {
//           leaseDocuments.add({
//             "name": value["fileName"] ?? "Unknown File",
//             "uploadDate": value["uploadDate"] ?? "Unknown Date",
//             "url": key, // URL (can be refined based on download logic)
//           });
//         });
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch tenant details: $e");
//     } finally {
//       isLoading(false); // Stop loading
//     }
//   }

//   /// Clear data (to ensure no stale data remains)
//   void clearData() {
//     tenantDetails.clear();
//     leaseDocuments.clear();
//   }
// }

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TenantDetailsController extends GetxController {
  final String tenantDocId;
  RxBool isLoading = true.obs;
  RxMap<String, dynamic> tenantDetails = <String, dynamic>{}.obs;
  RxList<Map<String, String>> leaseDocuments = <Map<String, String>>[].obs;
  RxList<Map<String, dynamic>> paymentDetails = <Map<String, dynamic>>[].obs;

  TenantDetailsController(this.tenantDocId);

  @override
  void onInit() {
    super.onInit();
    fetchTenantDetails();
  }

  /// **Fetch tenant details & payments**
  Future<void> fetchTenantDetails() async {
    try {
      isLoading(true);
      tenantDetails.clear();
      leaseDocuments.clear();
      paymentDetails.clear();

      // **Fetch tenant details from Firestore**
      final firestoreDoc = await FirebaseFirestore.instance
          .collection('All Users')
          .doc(tenantDocId)
          .get();

      if (firestoreDoc.exists) {
        tenantDetails.assignAll(firestoreDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Tenant not found in Firestore");
      }

      // **Fetch payments from Payments subcollection**
      QuerySnapshot paymentSnapshot = await FirebaseFirestore.instance
          .collection("All Users")
          .doc(tenantDocId)
          .collection("Payments")
          .orderBy("paymentDate", descending: true) // Get latest first
          .get();

      if (paymentSnapshot.docs.isNotEmpty) {
        paymentDetails.value = paymentSnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            "amount": data["amount"]?.toString() ?? "0",
            "paymentDate": data["paymentDate"] ?? "N/A",
            "paymentStatus": data["paymentStatus"] ?? "Pending",
            "paymentMethod": data["paymentMethod"] ?? "N/A",
          };
        }).toList();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch tenant details: $e");
    } finally {
      isLoading(false);
    }
  }
}
