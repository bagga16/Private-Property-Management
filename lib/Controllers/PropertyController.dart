// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/Models/PropertyModel.dart';

// class PropertyController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final DatabaseReference _realtimeDB = FirebaseDatabase.instance.ref();

//   RxList<PropertyModel> properties = <PropertyModel>[].obs; // All properties
//   RxList<PropertyModel> filteredProperties = <PropertyModel>[].obs;
//   RxInt selectedTabIndex = 0.obs;
//   RxString selectedFilterOption = ''.obs;
//   RxString searchQuery = ''.obs;
//   var selectedProperty = Rxn<PropertyModel>();

//   final List<String> tabs = [
//     "  All  ",
//     "Property Type",
//     "No. Of Units",
//     "Location",
//     "Status",
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProperties();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//     fetchProperties();
//   }

//   Future<void> fetchProperties() async {
//     try {
//       QuerySnapshot querySnapshot =
//           await _firestore.collection('All Properties').get();

//       List<PropertyModel> fetchedProperties = [];
//       for (var doc in querySnapshot.docs) {
//         PropertyModel property =
//             PropertyModel.fromMap(doc.data() as Map<String, dynamic>);
//         final propertyId = property.id;

//         // Fetch images from Realtime Database
//         final DataSnapshot imageSnapshot =
//             await _realtimeDB.child('property_images/$propertyId').get();
//         if (imageSnapshot.value != null) {
//           Map<dynamic, dynamic>? images =
//               imageSnapshot.value as Map<dynamic, dynamic>?;
//           if (images != null && images.isNotEmpty) {
//             property.imagePath = images.values.first['image'] ?? '';
//           }
//         }
//         fetchedProperties.add(property);
//       }

//       properties.value = fetchedProperties;
//       filteredProperties.value = fetchedProperties; // Default to all properties
//     } catch (e) {
//       print("Error fetching properties: $e");
//       Get.snackbar("Error", "Failed to fetch properties: $e",
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   void selectProperty(PropertyModel property) {
//     selectedProperty.value = property;
//   }

//   void applyFilter() {
//     switch (selectedTabIndex.value) {
//       case 1: // Property Type
//         filteredProperties.value = properties
//             .where((property) => property.type == selectedFilterOption.value)
//             .toList();
//         break;
//       case 2: // Number of Units
//         if (selectedFilterOption.value == "Above 20") {
//           filteredProperties.value =
//               properties.where((property) => property.units > 20).toList();
//         } else if (selectedFilterOption.value == "Below 20") {
//           filteredProperties.value =
//               properties.where((property) => property.units <= 20).toList();
//         } else {
//           filteredProperties.value = properties
//               .where((property) =>
//                   property.units.toString() == selectedFilterOption.value)
//               .toList();
//         }
//         break;
//       case 3: // Location
//         filteredProperties.value = properties
//             .where((property) =>
//                 property.address.contains(selectedFilterOption.value))
//             .toList();
//         break;
//       case 4: // Status
//         filteredProperties.value = properties
//             .where((property) => property.status == selectedFilterOption.value)
//             .toList();
//         break;
//       default: // All
//         filteredProperties.value = properties;
//     }
//   }

//   void resetFilters() {
//     filteredProperties.value = properties;
//   }

//   void searchProperties(String query) {
//     filteredProperties.value = properties
//         .where((property) =>
//             property.title.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB = FirebaseDatabase.instance.ref();

  RxList<PropertyModel> properties = <PropertyModel>[].obs; // All properties
  RxList<PropertyModel> filteredProperties = <PropertyModel>[].obs;
  RxBool isLoading = false.obs; // Loading state
  RxInt selectedTabIndex = 0.obs;
  RxString selectedFilterOption = ''.obs;

  final List<String> tabs = [
    "  All  ",
    "Property Type",
    "No. Of Units",
    "Location",
    "Status",
  ];

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  @override
  void onReady() {
    super.onReady();
    fetchProperties();
  }

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
      filteredProperties.value = fetchedProperties; // Default to all properties
    } catch (e) {
      print("Error fetching properties: $e");
      Get.snackbar("Error", "Failed to fetch properties: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

  void resetFilters() {
    filteredProperties.value = properties;
  }

  void searchProperties(String query) {
    filteredProperties.value = properties
        .where((property) =>
            property.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
