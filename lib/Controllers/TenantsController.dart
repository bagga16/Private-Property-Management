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
          await FirebaseFirestore.instance.collection('All Users').get();

      List<Tenant> fetchedTenants = [];

      for (var doc in snapshot.docs) {
        String tenantId = doc.id;
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Default values
        String unitId = "N/A";
        String rentAmount = "0";
        String leaseStart = "N/A";
        String leaseEnd = "N/A";

        // Fetch booked unit details
        QuerySnapshot bookedUnitsSnapshot = await FirebaseFirestore.instance
            .collection("All Users")
            .doc(tenantId)
            .collection("Booked Units")
            .limit(1) // Get latest booked unit
            .get();

        if (bookedUnitsSnapshot.docs.isNotEmpty) {
          var bookedUnitData =
              bookedUnitsSnapshot.docs.first.data() as Map<String, dynamic>;
          unitId = bookedUnitData["unitId"] ?? "N/A";
          rentAmount = bookedUnitData["rentAmount"]?.toString() ?? "0";
          leaseStart = bookedUnitData["startDate"] ?? "N/A";
          leaseEnd = bookedUnitData["endDate"] ?? "N/A";
        }

        // Create tenant object
        fetchedTenants.add(Tenant(
          id: tenantId,
          name: data["name"] ?? "N/A",
          status: data["status"] ?? "Inactive",
          email: data["email"] ?? "N/A",
          phone: data["phone"] ?? "N/A",
          tenantId: data["tenantId"] ?? "N/A",
          unitId: unitId, // ✅ Now fetching from Booked Units
          leaseStart: leaseStart,
          leaseEnd: leaseEnd,
          createdDate: data["createdDate"] ?? "N/A",
          updatedDate: data["updatedDate"] ?? data["createdDate"] ?? "N/A",
          rentAmount: rentAmount,
          securityDeposit: bookedUnitsSnapshot.docs.isNotEmpty
              ? bookedUnitsSnapshot.docs.first["depositAmount"]?.toString()
              : "N/A",
          paymentStatus: bookedUnitsSnapshot.docs.isNotEmpty
              ? bookedUnitsSnapshot.docs.first["paymentStatus"]
              : "N/A",
        ));
      }

      tenants.value = fetchedTenants;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch tenants: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // /// Fetch all tenants from Firestore
  // void fetchTenants() async {
  //   try {
  //     isLoading.value = true;

  //     // Fetch tenants from Firestore
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection('All Users').get();

  //     // Map Firestore documents to Tenant objects
  //     tenants.value = snapshot.docs.map((doc) {
  //       return Tenant.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  //     }).toList();
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to fetch tenants: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Refresh tenants manually (useful when returning to screen)
  void refreshTenants() => fetchTenants();
}
