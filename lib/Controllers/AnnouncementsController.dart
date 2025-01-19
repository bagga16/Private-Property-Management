import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:private_property_management/Models/AnnouncementModel.dart';

class AnnouncementsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list of announcements
  RxList<AnnouncementModel> announcements = <AnnouncementModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenToAnnouncements(); // Real-time listener
  }

  // Listen to real-time updates for announcements
  void listenToAnnouncements() {
    _firestore.collection('All Announcements').snapshots().listen((snapshot) {
      announcements.value = snapshot.docs
          .map((doc) => AnnouncementModel.fromMap(
                doc.id,
                doc.data() as Map<String, dynamic>,
              ))
          .toList();
    });
  }
}
