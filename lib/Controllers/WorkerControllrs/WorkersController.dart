import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_property_management/Models/WorkerModel.dart';

class WorkersController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list of workers
  RxList<WorkerModel> workers = <WorkerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWorkers(); // Fetch workers on controller initialization
  }

  @override
  void onReady() {
    super.onReady();
    refreshWorkers(); // Ensure fresh data when screen is opened
  }

  // Fetch workers from Firestore
  Future<void> fetchWorkers() async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection('All Workers').get();
      workers.value = snapshot.docs
          .map((doc) => WorkerModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch workers: $e");
      print("Error: Failed to fetch workers: $e");
    }
  }

  // Refresh worker list manually
  void refreshWorkers() {
    fetchWorkers(); // Fetch latest data
  }
}
