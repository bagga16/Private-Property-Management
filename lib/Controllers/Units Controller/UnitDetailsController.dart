// import 'package:get/get.dart';
// import 'package:firebase_database/firebase_database.dart';

// class UnitDetailsController extends GetxController {
//   final RxList<String> imageBase64List =
//       <String>[].obs; // Observables for images
//   final RxBool isLoading = false.obs; // Loading indicator
//   final RxInt currentImageIndex =
//       0.obs; // Current index for the carousel slider

//   Future<void> fetchUnitImages(String unitId) async {
//     try {
//       isLoading.value = true;

//       // Fetch images from Realtime Database
//       final DatabaseReference ref =
//           FirebaseDatabase.instance.ref('unit_images/$unitId');
//       DataSnapshot snapshot = await ref.get();

//       if (snapshot.exists) {
//         imageBase64List.clear();
//         Map<dynamic, dynamic> images = snapshot.value as Map<dynamic, dynamic>;

//         // Extract and add Base64 strings to the list
//         images.forEach((key, value) {
//           if (value['imageBase64'] != null) {
//             imageBase64List.add(value['imageBase64']);
//           }
//         });
//       } else {
//         imageBase64List.clear(); // Clear the list if no images are found
//       }
//     } catch (e) {
//       print("Error fetching unit images: $e");
//     } finally {
//       isLoading.value = false; // Stop the loading indicator
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class UnitDetailsController extends GetxController {
  final RxList<String> imageBase64List =
      <String>[].obs; // Store image Base64 strings
  final RxBool isLoading = false.obs; // Loading state
  final RxInt currentImageIndex = 0.obs; // Track current image for carousel

  /// **Fetch Images from Firebase Realtime Database**
  Future<void> fetchUnitImages(String unitId) async {
    try {
      isLoading.value = true;

      // 🔥 **Fix: Corrected database reference**
      final DatabaseReference ref =
          FirebaseDatabase.instance.ref('unit_data/$unitId/images');
      DataSnapshot snapshot = await ref.get();

      if (snapshot.exists && snapshot.value != null) {
        imageBase64List.clear();
        Map<dynamic, dynamic> images = snapshot.value as Map<dynamic, dynamic>;

        // 🔥 **Fix: Extract imageBase64 properly**
        images.forEach((key, value) {
          if (value.containsKey('fileBase64')) {
            imageBase64List.add(value['fileBase64']);
          }
        });
      } else {
        imageBase64List.clear(); // Ensure list is empty if no images are found
      }
    } catch (e) {
      print("Error fetching unit images: $e");
    } finally {
      isLoading.value = false; // Stop loading state
    }
  }
}
