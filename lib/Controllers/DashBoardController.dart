import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AuthController.dart';

class DashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB =
      FirebaseDatabase.instance.ref().child('profile_pictures');
  final AuthController _authController = Get.find<AuthController>();

  RxString userName = ''.obs;
  RxString userRole = ''.obs;
  RxString profilePic = ''.obs;

  RxString monthlyIncome = '\$0.00'.obs;
  RxInt totalPayments = 0.obs;
  RxInt totalLeases = 0.obs;
  RxInt totalMaintenanceRequests = 0.obs;
  RxInt totalWorkers = 0.obs;
  RxInt totalAnnouncements = 0.obs;
  RxInt totalUnits = 0.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  /// Fetch all dashboard-related data
  Future<void> fetchDashboardData() async {
    try {
      isLoading.value = true;
      final userId = await getUserData();
      await Future.wait([
        fetchProfilePic(userId),
        fetchMonthlyIncome(userId),
        fetchTotalPayments(),
        fetchTotalLeases(),
        fetchTotalMaintenanceRequests(),
        fetchTotalWorkers(),
        fetchTotalAnnouncements(),
        fetchTotalUnits()
      ]);
    } catch (e) {
      print("Error::: Failed to fetch dashboard data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch user data from Firestore
  Future<String> getUserData() async {
    final userId = _authController.userId;
    if (userId != null) {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final data = doc.data()!;
        userName.value = data['name'] ?? 'N/A';
        userRole.value = data['role'] ?? 'N/A';
      }
    }
    return userId ?? '';
  }

  /// Fetch profile picture from Realtime Database
  Future<void> fetchProfilePic(String userId) async {
    try {
      final snapshot = await _realtimeDB.child(userId).get();
      if (snapshot.exists) {
        profilePic.value = snapshot.value as String;
      } else {
        profilePic.value = ''; // Default to empty if no image is found
      }
    } catch (e) {
      profilePic.value = '';
      Get.snackbar("Error", "Failed to fetch profile picture: $e");
    }
  }

  /// Fetch monthly income
  Future<void> fetchMonthlyIncome(String userId) async {
    final snapshot = await _firestore
        .collection('payments')
        .where('userId', isEqualTo: userId)
        .where('date',
            isGreaterThan: DateTime.now().subtract(const Duration(days: 30)))
        .get();

    double totalIncome = snapshot.docs.fold<double>(
        0.0,
        (sum, doc) =>
            sum +
            (doc.data()['amount'] != null
                ? doc.data()['amount'] as double
                : 0.0));
    monthlyIncome.value = '\$${totalIncome.toStringAsFixed(2)}';
  }

  /// Fetch total payments
  Future<void> fetchTotalPayments() async {
    final snapshot = await _firestore.collection('All Tenants').get();
    totalPayments.value = snapshot.docs.length;
  }

  /// Fetch total leases
  Future<void> fetchTotalLeases() async {
    final snapshot = await _firestore.collection('All Tenants').get();
    totalLeases.value = snapshot.docs.length;
  }

  /// Fetch total maintenance requests
  Future<void> fetchTotalMaintenanceRequests() async {
    final snapshot = await _firestore.collection('Maintenance Requests').get();
    totalMaintenanceRequests.value = snapshot.docs.length;
  }

  /// Fetch total workers
  Future<void> fetchTotalWorkers() async {
    final snapshot = await _firestore.collection('All Workers').get();
    totalWorkers.value = snapshot.docs.length;
  }

  /// Fetch total announcements
  Future<void> fetchTotalAnnouncements() async {
    final snapshot = await _firestore.collection('All Announcements').get();
    totalAnnouncements.value = snapshot.docs.length;
  }

  /// Fetch total announcements
  Future<void> fetchTotalUnits() async {
    final snapshot = await _firestore.collection('All Units').get();
    totalUnits.value = snapshot.docs.length;
  }
}
