// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:private_property_management/Models/UnitModel.dart';

// class UnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

//   RxList<UnitModel> units = <UnitModel>[].obs;
//   RxBool isLoading = false.obs;

//   // Fetch Units from Firestore and Realtime Database
//   Future<void> fetchUnits() async {
//     try {
//       isLoading.value = true;
//       QuerySnapshot snapshot = await firestore.collection("All Units").get();
//       List<UnitModel> fetchedUnits = [];

//       for (var doc in snapshot.docs) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         String documentId = doc.id;

//         // Fetch the first Base64-encoded image from Realtime Database
//         DatabaseReference imageRef =
//             realtimeDatabase.ref("unitImages/$documentId");
//         DataSnapshot imageSnapshot = await imageRef.limitToFirst(1).get();
//         String base64Image = "";

//         if (imageSnapshot.value != null) {
//           Map<dynamic, dynamic> images =
//               imageSnapshot.value as Map<dynamic, dynamic>;
//           base64Image = images.values.first["imageBase64"] ?? "";
//         }

//         fetchedUnits.add(UnitModel(
//           name: data['name'],
//           unitId: data['unitId'],
//           propertyId: data['propertyId'],
//           status: data['status'],
//           rentAmount: data['rentAmount'],
//           area: data['area'],
//           createdDate: formatDate(data['createdDate']),
//           updatedDate: formatDate(data['updatedDate']),
//           description: data['description'],
//           documentId: documentId,
//           imagePath: base64Image, // Store Base64-encoded image
//         ));
//       }

//       units.assignAll(fetchedUnits);
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   String formatDate(String date) {
//     final dateTime = DateTime.parse(date);
//     return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
//   }
// }

// // import 'package:get/get.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:private_property_management/Models/UnitModel.dart';

// // // class UnitController extends GetxController {
// // //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
// // //   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

// // //   RxList<UnitModel> units = <UnitModel>[].obs;
// // //   RxBool isLoading = false.obs;

// // //   // Fetch Units by Property ID
// // //   Future<void> fetchUnitsByProperty(String propertyId) async {
// // //     try {
// // //       isLoading.value = true;
// // //       QuerySnapshot snapshot = await firestore
// // //           .collection("All Units")
// // //           .where("propertyId", isEqualTo: propertyId)
// // //           .get();

// // //       List<UnitModel> fetchedUnits = [];
// // //       for (var doc in snapshot.docs) {
// // //         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// // //         String documentId = doc.id;

// // //         // Fetch the first Base64-encoded image from Realtime Database
// // //         DatabaseReference imageRef =
// // //             realtimeDatabase.ref("unitImages/$documentId");
// // //         DataSnapshot imageSnapshot = await imageRef.limitToFirst(1).get();
// // //         String base64Image = "";

// // //         if (imageSnapshot.exists) {
// // //           Map<dynamic, dynamic> images =
// // //               imageSnapshot.value as Map<dynamic, dynamic>;
// // //           base64Image = images.values.first["imageBase64"] ?? "";
// // //         }

// // //         fetchedUnits.add(UnitModel.fromMap(data, documentId, base64Image));
// // //       }

// // //       units.assignAll(fetchedUnits);
// // //     } catch (e) {
// // //       Get.snackbar("Error", "Failed to fetch units: $e");
// // //     } finally {
// // //       isLoading.value = false;
// // //     }
// // //   }

// // //   String formatDate(String date) {
// // //     final dateTime = DateTime.parse(date);
// // //     return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
// // //   }
// // // }
// // class UnitController extends GetxController {
// //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
// //   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

// //   RxList<UnitModel> units = <UnitModel>[].obs;
// //   RxBool isLoading = false.obs;

// //   // Fetch Units by Property ID
// //   Future<void> fetchUnitsByProperty(String propertyId) async {
// //     try {
// //       isLoading.value = true;
// //       QuerySnapshot snapshot = await firestore
// //           .collection("All Units")
// //           .where("propertyId", isEqualTo: propertyId)
// //           .get();

// //       List<UnitModel> fetchedUnits = [];
// //       for (var doc in snapshot.docs) {
// //         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //         String documentId = doc.id;

// //         // Fetch the first Base64-encoded image from Realtime Database
// //         DatabaseReference imageRef =
// //             realtimeDatabase.ref("unitImages/$documentId");
// //         DataSnapshot imageSnapshot = await imageRef.limitToFirst(1).get();
// //         String base64Image = "";

// //         if (imageSnapshot.exists && imageSnapshot.value != null) {
// //           Map<dynamic, dynamic>? images =
// //               imageSnapshot.value as Map<dynamic, dynamic>?;
// //           if (images != null && images.isNotEmpty) {
// //             base64Image = images.values.first["imageBase64"] ?? "";
// //           }
// //         }

// //         // Add unit to the list with fetched data
// //         fetchedUnits.add(UnitModel.fromMap(data, documentId, base64Image));
// //       }

// //       // Update the units list
// //       units.assignAll(fetchedUnits);
// //     } catch (e) {
// //       Get.snackbar("Error", "Failed to fetch units: $e");
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }

// //   String formatDate(String date) {
// //     final dateTime = DateTime.parse(date);
// //     return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
// //   }
// // }

//######################

import 'dart:convert';
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

        // Fetch image from Realtime Database
        DataSnapshot imageSnapshot =
            await realtimeDB.child('unit_images/$unitId').get();
        String imagePath = "";
        if (imageSnapshot.value != null) {
          Map<dynamic, dynamic> images =
              imageSnapshot.value as Map<dynamic, dynamic>;
          if (images.isNotEmpty) {
            imagePath = images.values.first['imageBase64'] ?? "";
          }
        }

        fetchedUnits.add(UnitModel.fromMap(data, imagePath));
      }

      units.assignAll(fetchedUnits);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch units: $e");

      print("Error:::::Failed to fetch units: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
