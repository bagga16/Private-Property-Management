import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class TenantDetailsController extends GetxController {
  final String tenantDocId; // Firestore document ID
  RxBool isLoading = true.obs;
  RxMap<String, dynamic> tenantDetails = <String, dynamic>{}.obs;
  RxList<Map<String, String>> leaseDocuments = <Map<String, String>>[].obs;

  TenantDetailsController(this.tenantDocId);

  @override
  void onInit() {
    super.onInit();
    fetchTenantDetails();
  }

  void fetchTenantDetails() async {
    try {
      isLoading(true);

      // Fetch data from Firestore
      final firestoreDoc = await FirebaseFirestore.instance
          .collection('All Tenants')
          .doc(tenantDocId)
          .get();

      if (firestoreDoc.exists) {
        tenantDetails.assignAll(firestoreDoc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Tenant not found in Firestore");
      }

      // Fetch lease documents from Realtime Database
      final leaseDocsRef =
          FirebaseDatabase.instance.ref('tenants/$tenantDocId/lease_documents');
      final leaseDocsSnapshot = await leaseDocsRef.get();

      if (leaseDocsSnapshot.exists) {
        leaseDocuments.clear();
        Map<dynamic, dynamic> docs =
            leaseDocsSnapshot.value as Map<dynamic, dynamic>;
        docs.forEach((key, value) {
          leaseDocuments.add({"name": key, "url": value.toString()});
        });
      } else {
        leaseDocuments.clear();
        print("No lease documents found for tenant.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch tenant details: $e");
    } finally {
      isLoading(false);
    }
  }
}
