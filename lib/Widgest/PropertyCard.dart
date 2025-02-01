import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/App%20Screen/Proprties/PropertyDetailsScreen.dart';
import 'package:private_property_management/Controllers/PropertyDetailsController.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback? onTap;

  PropertyCard({super.key, required this.property, this.onTap});

  // Format date to DD/MM/YYYY
  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    final PropertyDetailsController controller =
        Get.put(PropertyDetailsController(propertyId: property.id));
    return GestureDetector(
      onTap: () {
        // Navigate to PropertyDetailsScreen with property details
        Get.to(() => PropertyDetailsScreen(property: property));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child:
                    property.imagePath != null && property.imagePath!.isNotEmpty
                        ? Image.memory(
                            base64Decode(property.imagePath!),
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          )
                        : const SizedBox(
                            height: 150,
                            child: Center(child: Text("No Image Available")),
                          ),
              ),
              const SizedBox(height: 10),

              // Content Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          property.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: property.status == "Active"
                              ? const Color.fromRGBO(0, 158, 61, 1)
                              : const Color.fromRGBO(158, 0, 0, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          property.status,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Row(
                    children: [
                      Text(
                        "ID: ${property.id.substring(0, 8)}", // First 8 characters
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14,
                              color: Color.fromRGBO(139, 200, 63, 1),
                            ),
                            Flexible(
                              child: Row(
                                children: [
                                  Text(
                                    property.address,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    property.state,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    property.zip,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    property.country,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 88, 122, 1),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${property.type}  ",
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                        TextSpan(
                          text:
                              "Units: ${controller.totalUnits.value.toString()}",
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),

                  // Description
                  Text(
                    property.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Created and Updated
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Created: ",
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                            TextSpan(
                              text: formatDate(property.createdDate),
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Updated: ",
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(83, 88, 122, 1),
                              ),
                            ),
                            TextSpan(
                              text: formatDate(property.updatedDate),
                              style: const TextStyle(
                                fontSize: 9,
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
            ],
          ),
        ),
      ),
    );
  }
}
