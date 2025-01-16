import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB = FirebaseDatabase.instance.ref();

  RxList<PropertyModel> properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProperties();
  }

  Future<void> fetchProperties() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('All Properties').get();

      List<PropertyModel> fetchedProperties = [];
      for (var doc in querySnapshot.docs) {
        try {
          // Map property data
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
            } else {
              property.imagePath = ''; // Default to empty if no images
            }
          } else {
            property.imagePath = ''; // Default to empty if no images
          }

          fetchedProperties.add(property);
        } catch (e) {
          print("Error processing property: ${doc.id}, Error: $e");
        }
      }

      properties.value = fetchedProperties;
    } catch (e) {
      print("Error fetching properties: $e");
      Get.snackbar("Error", "Failed to fetch properties: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
