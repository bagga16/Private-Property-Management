// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/Models/TenantModel.dart';

// class TenantsController extends GetxController {
//   var tenants = <Tenant>[].obs; // Observable list of tenants
//   var isLoading = true.obs; // Observable for loading state

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTenants();
//   }

//   void fetchTenants() async {
//     try {
//       isLoading.value = true;
//       // Fetch tenants from Firestore
//       QuerySnapshot snapshot =
//           await FirebaseFirestore.instance.collection('All Tenants').get();

//       // Map Firestore documents to Tenant objects
//       tenants.value = snapshot.docs
//           .map((doc) => Tenant.fromMap(doc.data() as Map<String, dynamic>))
//           .toList();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to fetch tenants: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

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

  /// Fetch all tenants from Firestore
  /// Fetch all tenants from Firestore
  void fetchTenants() async {
    try {
      isLoading.value = true;

      // Fetch tenants from Firestore
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('All Tenants').get();

      // Map Firestore documents to Tenant objects
      tenants.value = snapshot.docs.map((doc) {
        return Tenant.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch tenants: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Add a new tenant to Firestore
  Future<void> addTenant(Tenant tenant) async {
    try {
      isLoading.value = true;

      // Convert Tenant object to Firestore-compatible Map
      Map<String, dynamic> tenantData = {
        "name": tenant.name,
        "status": tenant.status,
        "email": tenant.email,
        "phone": tenant.phone,
        "tenantId": tenant.tenantId,
        "unitId": tenant.unitId,
        "leaseStart": tenant.leaseStart,
        "leaseEnd": tenant.leaseEnd,
        "createdDate": tenant.createdDate,
        "updatedDate": tenant.updatedDate,
        "rent": tenant.rent,
      };

      // Add the tenant to Firestore
      await FirebaseFirestore.instance
          .collection('All Tenants')
          .add(tenantData);

      // Fetch the updated list of tenants
      fetchTenants();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add tenant: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
