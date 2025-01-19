import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Anouncements/AddAnoucementsScreen.dart';
import 'package:private_property_management/Controllers/AnnouncementsController.dart';
import 'package:private_property_management/Widgest/AnnouncementCard.dart';

class AnnouncementsScreen extends StatelessWidget {
  final AnnouncementsController _controller =
      Get.put(AnnouncementsController());

  AnnouncementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Announcements",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(AddAnnouncementScreen());
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 244, 248, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search,
                        color: Color.fromRGBO(37, 43, 92, 1), size: 22),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Announcements List
            Expanded(
              child: Obx(() {
                if (_controller.announcements.isEmpty) {
                  return const Center(
                    child: Text(
                      "No announcements found.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.announcements.length,
                  itemBuilder: (context, index) {
                    final announcement = _controller.announcements[index];
                    return AnnouncementCard(announcement: announcement);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
