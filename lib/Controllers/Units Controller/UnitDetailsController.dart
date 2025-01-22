import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class UnitDetailsController extends GetxController {
  final DatabaseReference _realtimeDb = FirebaseDatabase.instance.ref();

  RxList<String> imageBase64List = <String>[].obs; // Observables for images
  RxBool isLoading = false.obs;
  RxInt currentImageIndex = 0.obs;

  // Fetch Images from Realtime Database
  Future<void> fetchUnitImages(String documentId) async {
    try {
      isLoading.value = true;
      final DataSnapshot snapshot =
          await _realtimeDb.child('unitImages/$documentId').get();

      if (snapshot.value != null) {
        Map<dynamic, dynamic> images = snapshot.value as Map<dynamic, dynamic>;

        // Extract Base64 strings into the observable list
        imageBase64List.value = images.values
            .map((value) => value['imageBase64'] as String)
            .toList();
      } else {
        imageBase64List.clear(); // No images found
      }
    } catch (e) {
      print("Error fetching images: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
