import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/Units%20Controller/EditUnitController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class EditUnitScreen extends StatelessWidget {
  final String propertyId;
  final String unitId;

  EditUnitScreen({required this.propertyId, required this.unitId});

  final EditUnitController controller =
      Get.put(EditUnitController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // Initialize controller with property and unit IDs
    controller.initialize(propertyId, unitId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Edit Unit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Input Fields
                    CustomTextField(
                      controller: controller.unitNameController,
                      height: 48,
                      hintText: "Unit Name / Number",
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: controller.unitType.value,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(245, 244, 248, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Unit Type",
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w500,
                      ),
                      items: ["Unit Type", "Office", "House", "Building"]
                          .map((unitType) => DropdownMenuItem(
                                value: unitType,
                                child: Text(unitType),
                              ))
                          .toList(),
                      onChanged: (value) => controller.unitType.value = value!,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.areaController,
                      hintText: "Unit Area",
                      height: 48,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.rentAmountController,
                      keyboardType: TextInputType.number,
                      hintText: "Rent Amount",
                      height: 48,
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: controller.availabilityStatus.value,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(245, 244, 248, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Status",
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(37, 43, 92, 1),
                        fontWeight: FontWeight.w500,
                      ),
                      items:
                          ["Status", "Vacant", "Occupied", "Under Maintenance"]
                              .map((status) => DropdownMenuItem(
                                    value: status,
                                    child: Text(status),
                                  ))
                              .toList(),
                      onChanged: (value) =>
                          controller.availabilityStatus.value = value!,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.descriptionController,
                      height: 150,
                      hintText: "Description",
                      maxLines: 4,
                    ),
                    const SizedBox(height: 20),

                    // Update Button
                    Center(
                      child: SizedBox(
                        height: 62,
                        width: MediaQuery.of(context).size.width - 100,
                        child: ElevatedButton(
                          onPressed: controller.updateUnitDetails,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(139, 200, 63, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Update Unit",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              if (controller.isLoading.value)
                Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(139, 200, 63, 1),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
