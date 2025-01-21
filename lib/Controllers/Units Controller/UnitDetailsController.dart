import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class UnitDetailsController extends GetxController {
  final FirebaseDatabase _realtimeDb = FirebaseDatabase.instance;

  var unitImages = <String>[].obs; // List to hold fetched images
  var isLoadingImages = false.obs;

  // Fetch images for a specific unit from Realtime Database
  Future<void> fetchUnitImages(String unitId) async {
    try {
      isLoadingImages.value = true;
      final snapshot = await _realtimeDb.ref('units/$unitId/images').get();
      if (snapshot.value != null) {
        final data = snapshot.value as Map;
        unitImages.value = data.values.map((e) => e as String).toList();
      } else {
        unitImages.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch images: $e");
    } finally {
      isLoadingImages.value = false;
    }
  }
}
