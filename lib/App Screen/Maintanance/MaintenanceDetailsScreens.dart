import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceEditScreen.dart';
import 'package:private_property_management/Controllers/MaintenanceController/MaintenanceController.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

class MaintenanceDetailsScreen extends StatelessWidget {
  final MaintenanceRequestModel request;

  final MaintenanceController controller = Get.put(MaintenanceController());
  MaintenanceDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Maintenance  Details",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/maintenance-edit-screen',
                        arguments: request,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Image(
                          image: AssetImage('assets/icons/edditProfile.png')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Image
              FutureBuilder<String?>(
                future: controller.fetchMaintenanceImage(request.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // ✅ Show loader while fetching
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    try {
                      String base64String = snapshot.data!;
                      if (base64String.contains(",")) {
                        base64String = base64String
                            .split(",")[1]; // ✅ Remove Base64 prefix if exists
                      }
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: MemoryImage(base64Decode(
                                base64String)), // ✅ Decode Base64 Image
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } catch (e) {
                      print("Error decoding image: $e");
                    }
                  }
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/maintenance.png'), // ✅ Default Image
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 9),
              // Request Info
              Text(
                "Requested ID#  ${request.id.substring(0, 6)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF252B5C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                request.description,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF53587A),
                ),
              ),
              const SizedBox(height: 38),

              // Details Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Requested: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.requestedDate,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Assigned to: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.assignedTo,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Priority: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.priority,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Status: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.status,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Created: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.requestedDate,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Updated: ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                      children: [
                        TextSpan(
                          text: request.resolvedDate,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
