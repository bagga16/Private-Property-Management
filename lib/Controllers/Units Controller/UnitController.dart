// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/Models/UnitModel.dart';

// class UnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final DatabaseReference realtimeDB = FirebaseDatabase.instance.ref();

//   RxList<UnitModel> units = <UnitModel>[].obs;
//   RxBool isLoading = false.obs;

//   Future<void> fetchUnits(String propertyId) async {
//     try {
//       isLoading.value = true;
//       QuerySnapshot snapshot = await firestore
//           .collection('All Properties')
//           .doc(propertyId)
//           .collection('Units')
//           .get();

//       List<UnitModel> fetchedUnits = [];
//       for (var doc in snapshot.docs) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         String unitId = data['unitId'];

//         // Fetch image from Realtime Database
//         DataSnapshot imageSnapshot =
//             await realtimeDB.child('unit_images/$unitId').get();
//         String imagePath = "";
//         if (imageSnapshot.value != null) {
//           Map<dynamic, dynamic> images =
//               imageSnapshot.value as Map<dynamic, dynamic>;
//           if (images.isNotEmpty) {
//             imagePath = images.values.first['imageBase64'] ?? "";
//           }
//         }

//         fetchedUnits.add(UnitModel.fromMap(data, imagePath));
//       }

//       units.assignAll(fetchedUnits);
//     } catch (e) {
//       Get.snackbar("Error", "Failed to fetch units: $e");

//       print("Error:::::Failed to fetch units: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Models/UnitModel.dart';

class UnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DatabaseReference realtimeDB = FirebaseDatabase.instance.ref();

  RxList<UnitModel> units = <UnitModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchUnits(String propertyId) async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await firestore
          .collection('All Properties')
          .doc(propertyId)
          .collection('Units')
          .get();

      List<UnitModel> fetchedUnits = [];
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String unitId = data['unitId'];

        // **Fetch Images from Firebase Realtime Database**
        List<String> imagePaths = await _fetchUnitImages(unitId);

        fetchedUnits.add(UnitModel.fromMap(data, imagePaths));
      }

      units.assignAll(fetchedUnits);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch units: $e");
      print("Error:::::Failed to fetch units: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// **Fetch Unit Images from Firebase Realtime Database**
  Future<List<String>> _fetchUnitImages(String unitId) async {
    try {
      DataSnapshot imageSnapshot =
          await realtimeDB.child('unit_data/$unitId/images').get();

      List<String> imagePaths = [];
      if (imageSnapshot.exists && imageSnapshot.value != null) {
        Map<dynamic, dynamic> images =
            imageSnapshot.value as Map<dynamic, dynamic>;

        for (var entry in images.values) {
          if (entry.containsKey('fileBase64')) {
            imagePaths.add(entry['fileBase64']);
          }
        }
      }
      return imagePaths;
    } catch (e) {
      print("Error fetching unit images: $e");
      return [];
    }
  }
}
