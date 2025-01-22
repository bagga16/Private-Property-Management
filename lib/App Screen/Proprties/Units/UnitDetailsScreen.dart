import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/Units%20Controller/UnitDetailsController.dart';
import 'package:private_property_management/Models/UnitModel.dart';

class UnitDetailsScreen extends StatelessWidget {
  final UnitModel unit;
  final UnitDetailsController controller = Get.put(UnitDetailsController());

  UnitDetailsScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // Fetch images when screen is loaded
    controller.fetchUnitImages(unit.documentId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                  size: 18),
                            ),
                          ),
                          const Text(
                            "Unit Details",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle edit action
                            },
                            child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                              child: Icon(Icons.edit, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Carousel Slider
                      CarouselSlider(
                        items: controller.imageBase64List.isEmpty
                            ? [
                                // Placeholder if no images are available
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/placeholder.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                )
                              ]
                            : controller.imageBase64List.map((base64Image) {
                                Uint8List decodedImage =
                                    base64Decode(base64Image);
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.memory(
                                    decodedImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            controller.imageBase64List.refresh();
                            controller.currentImageIndex.value = index;
                          },
                        ),
                      ),
                      // Carousel Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.imageBase64List
                            .asMap()
                            .entries
                            .map((entry) {
                          return GestureDetector(
                            onTap: () => {}, // Optional: Tap functionality
                            child: Obx(() {
                              bool isSelected =
                                  controller.currentImageIndex.value ==
                                      entry.key;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: isSelected
                                    ? 8.0
                                    : 4.0, // Larger for selected
                                height: isSelected ? 9.0 : 4.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromRGBO(139, 200, 63, 1)),
                              );
                            }),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 4),

                      // Unit Title
                      Text(
                        unit.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(37, 43, 92, 1),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Description Section.
                      const Text(
                        "Description",
                        style: const TextStyle(
                          fontSize: 19.5,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(37, 43, 92, 1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        unit.description,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                      const SizedBox(height: 9),

                      // Property Info Grid
                      Container(
                        child: Column(
                          children: [
                            _buildTwoColumnRow(
                              title1: "Unit ID",
                              value1: unit.unitId,
                              title2: "Property ID",
                              value2: unit.propertyId,
                            ),
                            const SizedBox(height: 29),
                            _buildTwoColumnRow(
                              title1: "Unit Type",
                              value1: "Office",
                              title2: "Status",
                              value2: unit.status,
                            ),
                            const SizedBox(height: 29),
                            _buildTwoColumnRow(
                              title1: "Area",
                              value1: unit.area,
                              title2: "Rent Amount",
                              value2: unit.rentAmount,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Created:  ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: unit.createdDate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(83, 88, 122, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Updated:  ",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: unit.updatedDate,
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  // Two-column row for property info
  Widget _buildTwoColumnRow({
    required String title1,
    required String value1,
    required String title2,
    required String value2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildInfoItem(title1, value1),
        ),
        Expanded(
          child: _buildInfoItem(title2, value2),
        ),
      ],
    );
  }

  // Single info item
  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/point.png')),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(83, 88, 122, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ),
      ],
    );
  }
}
