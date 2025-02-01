import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB = FirebaseDatabase.instance.ref();

  RxList<PropertyModel> properties = <PropertyModel>[].obs; // All properties
  RxList<PropertyModel> filteredProperties = <PropertyModel>[].obs;
  final RxInt totalUnits = 0.obs;
  RxBool isLoading = false.obs; // Loading state
  RxInt selectedTabIndex = 0.obs;

  final List<String> tabs = [
    "  All  ",
    "Property Type",
    "Status",
    "No. Of Units",
    "Location",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   fetchProperties();
  // }

  Future<void> fetchProperties() async {
    try {
      isLoading.value = true; // Show loading indicator
      QuerySnapshot querySnapshot =
          await _firestore.collection('All Properties').get();

      List<PropertyModel> fetchedProperties = [];
      for (var doc in querySnapshot.docs) {
        PropertyModel property =
            PropertyModel.fromMap(doc.data() as Map<String, dynamic>);
        final propertyId = property.id;

        // Fetch images from Realtime Database
        final DataSnapshot imageSnapshot =
            await _realtimeDB.child('property_images/$propertyId').get();
        if (imageSnapshot.value != null) {
          Map<dynamic, dynamic>? images =
              imageSnapshot.value as Map<dynamic, dynamic>?;
          if (images != null && images.isNotEmpty) {
            property.imagePath = images.values.first['image'] ?? '';
          }
        }
        fetchedProperties.add(property);
      }

      properties.value = fetchedProperties;
      filteredProperties.value =
          fetchedProperties.toList(); // Default to all properties
    } catch (e) {
      print("Error fetching properties: $e");
      Get.snackbar("Error", "Failed to fetch properties: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

// Apply filter for Property Type
  void applyPropertyTypeFilter(String propertyType) {
    filteredProperties.assignAll(
      properties.where((property) => property.type == propertyType).toList(),
    );
  }

  // Apply filter for Property Status
  void applyPropertyStatusFilter(String status) {
    filteredProperties.assignAll(
      properties.where((property) => property.status == status).toList(),
    );
  }

  // Reset filters (Tab 0 - All)
  void resetFilters() {
    filteredProperties.assignAll(properties.toList());
  }

  // Update selected tab index and handle filtering
  void updateSelectedTabIndex(int index) {
    selectedTabIndex.value = index;

    if (index == 0) {
      resetFilters(); // Reset to all properties
    }
  }

  // Apply filter for Number of Units
  void applyUnitsFilter(int? minUnits, int? maxUnits) {
    filteredProperties.assignAll(
      properties.where((property) {
        int units = property.units;
        if (minUnits != null && units < minUnits) return false;
        if (maxUnits != null && units > maxUnits) return false;
        return true;
      }).toList(),
    );
  }

  void searchProperties(String query) {
    filteredProperties.value = properties
        .where((property) =>
            property.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
