import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class TenantsController extends GetxController {
  var tenants = <Tenant>[].obs; // Observable list of tenants
  var isLoading = true.obs; // Observable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchTenants();
  }

  void fetchTenants() async {
    try {
      isLoading.value = true;
      // Fetch tenants from Firestore
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('All Tenants').get();

      // Map Firestore documents to Tenant objects
      tenants.value = snapshot.docs
          .map((doc) => Tenant.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch tenants: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
