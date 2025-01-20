import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class LeaseDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Tenant> tenants = <Tenant>[].obs; // List of tenants
  RxBool isLoading = true.obs; // Loading state
  RxInt selectedTabIndex = 0.obs; // Selected tab index

  final List<String> tabs = [
    "All Leases",
    "Expire in 7 Days",
    "Expire in 14 Days",
    "Expire in 21 Days"
  ];

  @override
  void onInit() {
    super.onInit();
    fetchTenants(); // Automatically fetch tenants when the screen opens
  }

  /// Fetch tenants from Firestore
  Future<void> fetchTenants() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore.collection('All Tenants').get();
      tenants.value = snapshot.docs
          .map((doc) {
            try {
              return Tenant.fromMap(doc.data() as Map<String, dynamic>, doc.id);
            } catch (e) {
              print("Error parsing tenant data: $e");
              return null;
            }
          })
          .where((tenant) => tenant != null)
          .toList()
          .cast<Tenant>();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch tenants: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<Tenant> getFilteredTenants() {
    if (selectedTabIndex.value == 0) {
      return tenants; // Show all leases
    }

    final now = DateTime.now();
    int lowerBound = 0;
    int upperBound = 0;

    switch (selectedTabIndex.value) {
      case 1: // Expire in 7 days
        lowerBound = 1;
        upperBound = 7;
        break;
      case 2: // Expire in 14 days
        lowerBound = 8;
        upperBound = 14;
        break;
      case 3: // Expire in 21 days
        lowerBound = 15;
        upperBound = 21;
        break;
      default:
        return tenants;
    }

    return tenants.where((tenant) {
      try {
        final leaseEnd = _parseDate(tenant.leaseEnd);
        final difference = leaseEnd.difference(now).inDays;
        return difference >= lowerBound && difference <= upperBound;
      } catch (e) {
        print("Error parsing date for tenant ${tenant.name}: $e");
        return false;
      }
    }).toList();
  }

  /// Parse date safely
  DateTime _parseDate(String date) {
    try {
      // Remove extra text like "at 3"
      final sanitizedDate = date.split(' ')[0];
      return DateFormat('dd/MM/yyyy').parse(sanitizedDate);
    } catch (e) {
      print("Invalid date format encountered: $date");
      throw FormatException("Invalid date format: $date");
    }
  }
}
