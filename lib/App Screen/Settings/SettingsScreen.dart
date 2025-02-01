import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Common%20Components/CustomeButton.dart';
import 'package:private_property_management/Controllers/SettingsController.dart';
import 'package:private_property_management/Controllers/AuthController.dart';
import 'package:private_property_management/Home.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Back Button and Title
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(HomeScreen()),
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromRGBO(245, 244, 248, 1),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 18,
                                    color: Color.fromRGBO(37, 43, 92, 1),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(width: 40),
                            ],
                          ),
                          const SizedBox(height: 30),

                          // Profile Avatar
                          GestureDetector(
                            onTap: controller.updateProfilePicture,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  const Color.fromRGBO(217, 217, 217, 1),
                              backgroundImage: controller
                                          .userModel.value.profilePic !=
                                      null
                                  ? MemoryImage(base64Decode(
                                      controller.userModel.value.profilePic!))
                                  : const AssetImage(
                                          'assets/images/profile.png')
                                      as ImageProvider,
                            ),
                          ),

                          const SizedBox(height: 7),

                          // User Name
                          GestureDetector(
                            onTap: () => showEditPopup("Edit Name", "name",
                                controller.userModel.value.name),
                            child: Text(
                              controller.userModel.value.name ?? "N/A",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(37, 43, 92, 1),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          // User ID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "ID: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                              Text(
                                controller.userModel.value.userId != null
                                    ? controller.userModel.value.userId!
                                        .substring(0, 7)
                                    : "84102",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),

                          // Role and Contact Info Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(245, 244, 248, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Role
                                GestureDetector(
                                  onTap: () => showEditPopup("Edit Role",
                                      "role", controller.userModel.value.role),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "  Role: ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(83, 88, 122, 1),
                                        ),
                                      ),
                                      Text(
                                        controller.userModel.value.role ??
                                            "N/A",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromRGBO(139, 200, 63, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Email
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Color.fromRGBO(139, 200, 63, 1),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      controller.userModel.value.email ?? "N/A",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(83, 88, 122, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Phone
                                GestureDetector(
                                  onTap: () => showEditPopup(
                                      "Edit Phone",
                                      "phone",
                                      controller.userModel.value.phone),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Color.fromRGBO(139, 200, 63, 1),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        controller.userModel.value.phone ??
                                            "N/A",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(83, 88, 122, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          // Log Out Button
                          GestureDetector(
                            onTap: authController.logout,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 17),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(245, 244, 248, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Log Out",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(37, 43, 92, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bottom Button
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: CustomButton(
                          text: "View Buildings",
                          onPressed: () {
                            // Your action for View Buildings
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void showEditPopup(String title, String field, String? initialValue) {
    final textController = TextEditingController(text: initialValue);

    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: TextField(
          controller: textController,
          keyboardType:
              field == "phone" ? TextInputType.number : TextInputType.text,
          maxLength: field == "phone" ? 10 : null,
          decoration: const InputDecoration(
            hintText: "Enter new value",
            counterText: "", // Removes the counter text
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newValue = textController.text.trim();

              if (field == "phone") {
                if (newValue.isEmpty ||
                    newValue.length != 10 ||
                    int.tryParse(newValue) == null) {
                  Get.snackbar(
                      "Error", "Please enter a valid 10-digit phone number.");
                  return;
                }
              }

              if (newValue.isNotEmpty) {
                controller.editUserField(field, newValue);
                Get.back();
              }
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
