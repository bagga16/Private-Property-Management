import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/AddAnouncementsController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddAnnouncementScreen extends StatelessWidget {
  final TextEditingController propertyController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final AddAnnouncementsController _controller =
      Get.put(AddAnnouncementsController());

  AddAnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Column(
              children: [
                // Header
                Row(
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
                      "New Announcements",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 27),

                // Input Fields
                CustomTextField(
                  height: 48,
                  hintText: "Property",
                  controller: propertyController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusBorderColor: Colors.transparent,
                  height: 160,
                  maxLines: 6,
                  hintText: "Enter Description",
                  controller: descriptionController,
                ),
                const SizedBox(height: 100),

                // Add Button
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 96,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        String propertyName = propertyController.text.trim();
                        String description = descriptionController.text.trim();

                        if (propertyName.isEmpty || description.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please fill all fields",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        } else {
                          _controller.addAnnouncement(
                            propertyName: propertyName,
                            description: description,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
