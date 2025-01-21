// // Step 1: Add Unit Model in GetX State Management
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:private_property_management/Models/UnitModel.dart';

// class UnitController extends GetxController {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

//   RxList<UnitModel> units = <UnitModel>[].obs;
//   RxBool isLoading = false.obs;

//   Future<void> fetchUnits() async {
//     try {
//       isLoading.value = true;
//       QuerySnapshot snapshot = await firestore.collection("All Units").get();
//       List<UnitModel> fetchedUnits = [];

//       for (var doc in snapshot.docs) {
//         Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//         String documentId = doc.id;

//         // Fetch the first image from Realtime Database
//         DatabaseReference imageRef =
//             realtimeDatabase.ref("unitImages/$documentId");
//         DataSnapshot imageSnapshot = await imageRef.limitToFirst(1).get();
//         String imageUrl = "";

//         if (imageSnapshot.value != null) {
//           Map<dynamic, dynamic> images =
//               imageSnapshot.value as Map<dynamic, dynamic>;
//           imageUrl = images.values.first["imageUrl"] ?? "";
//         }

//         fetchedUnits.add(UnitModel(
//           name: data['name'],
//           unitId: data['unitId'],
//           propertyId: data['propertyId'],
//           status: data['status'],
//           rentAmount: data['rentAmount'],
//           area: data['area'],
//           createdDate: data['createdDate'],
//           updatedDate: data['updatedDate'],
//           documentId: documentId,
//           imagePath: imageUrl,
//         ));
//       }

//       units.assignAll(fetchedUnits);
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:private_property_management/Models/UnitModel.dart';

class UnitController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseDatabase realtimeDatabase = FirebaseDatabase.instance;

  RxList<UnitModel> units = <UnitModel>[].obs;
  RxBool isLoading = false.obs;

  // Fetch Units from Firestore and Realtime Database
  Future<void> fetchUnits() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await firestore.collection("All Units").get();
      List<UnitModel> fetchedUnits = [];

      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String documentId = doc.id;

        // Fetch the first Base64-encoded image from Realtime Database
        DatabaseReference imageRef =
            realtimeDatabase.ref("unitImages/$documentId");
        DataSnapshot imageSnapshot = await imageRef.limitToFirst(1).get();
        String base64Image = "";

        if (imageSnapshot.value != null) {
          Map<dynamic, dynamic> images =
              imageSnapshot.value as Map<dynamic, dynamic>;
          base64Image = images.values.first["imageBase64"] ?? "";
        }

        fetchedUnits.add(UnitModel(
          name: data['name'],
          unitId: data['unitId'],
          propertyId: data['propertyId'],
          status: data['status'],
          rentAmount: data['rentAmount'],
          area: data['area'],
          createdDate: data['createdDate'],
          updatedDate: data['updatedDate'],
          documentId: documentId,
          imagePath: base64Image, // Store Base64-encoded image
        ));
      }

      units.assignAll(fetchedUnits);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
