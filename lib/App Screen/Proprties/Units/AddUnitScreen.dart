import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:private_property_management/Controllers/Units%20Controller/AddUnitController.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

class AddUnitScreen extends StatelessWidget {
  final String propertyId;
  final AddUnitController controller = Get.put(AddUnitController());

  AddUnitScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                    "Add Unit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Image picker
              // Image Picker Container
              GestureDetector(
                onTap: controller.pickImages,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_photo_alternate,
                            size: 50, color: Color.fromRGBO(157, 178, 206, 1)),
                        SizedBox(height: 8),
                        Text(
                          "Add Images",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(157, 178, 206, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Selected Images Section
              Obx(() => controller.selectedImages.isNotEmpty
                  ? Container(
                      height: 100, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: controller.selectedImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(controller.selectedImages[index].path),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox()), // Show nothing if no images are selected
              // GestureDetector(
              //   onTap: controller.pickImages,
              //   child: Container(
              //     height: 150,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: const Color.fromRGBO(245, 244, 248, 1),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Obx(() => controller.selectedImages.isNotEmpty
              //         ? ListView.builder(
              //             scrollDirection: Axis.horizontal,
              //             itemCount: controller.selectedImages.length,
              //             itemBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Image.file(
              //                   File(controller.selectedImages[index].path),
              //                   height: 150,
              //                   width: 150,
              //                   fit: BoxFit.cover,
              //                 ),
              //               );
              //             },
              //           )
              //         : const Center(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(Icons.add_photo_alternate,
              //                     size: 50,
              //                     color: Color.fromRGBO(157, 178, 206, 1)),
              //                 SizedBox(height: 8),
              //                 Text(
              //                   "Add Images",
              //                   style: TextStyle(
              //                       fontSize: 14,
              //                       fontWeight: FontWeight.w500,
              //                       color: Color.fromRGBO(157, 178, 206, 1)),
              //                 ),
              //               ],
              //             ),
              //           )),
              //   ),
              // ),

              const SizedBox(height: 33),

              // Input Fields
              CustomTextField(
                controller: controller.unitNameController,
                height: 48,
                hintText: "Unit Name / Number",
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 48,
                child: DropdownButtonFormField<String>(
                  value: controller.unitType.value,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(245, 244, 248, 1),
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
                      fontWeight: FontWeight.w500),
                  items: ["Unit Type", "Office", "House", "Building"]
                      .map((unitType) => DropdownMenuItem(
                            value: unitType,
                            child: Text(unitType),
                          ))
                      .toList(),
                  onChanged: (value) => controller.unitType.value = value!,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controller.areaController,
                keyboardType: TextInputType.number,
                hintText: "Unit Area ",
                height: 48,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controller.rentAmountController,
                keyboardType: TextInputType.number,
                hintText: "Rent Amount",
                height: 48,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: controller.depositAmountController,
                  height: 48,
                  keyboardType: TextInputType.phone,
                  hintText: "Security Deposit"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await controller.pickLeaseDate(
                            context, controller.leaseStartController);
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.leaseStartController,
                          height: 48,
                          hintText: "Lease Start Date",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await controller.pickLeaseDate(
                            context, controller.leaseEndController);
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.leaseEndController,
                          height: 48,
                          hintText: "Lease End Date",
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                height: 48,
                child: DropdownButtonFormField<String>(
                  value: controller.availabilityStatus.value,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(245, 244, 248, 1),
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
                      fontWeight: FontWeight.w500),
                  items: ["Status", "Vacant", "Occupied", "Under Maintenance"]
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) =>
                      controller.availabilityStatus.value = value!,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: controller.descriptionController,
                height: 150,
                hintText: "Description",
                maxLines: 4,
              ),
              SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: controller.pickDocuments,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.attach_file),
                      const SizedBox(width: 10),
                      Obx(() {
                        if (controller.selectedDocuments.isEmpty) {
                          return const Text(
                            "Select Lease Documents",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        } else {
                          return Text(
                            "${controller.selectedDocuments.length} file(s) selected",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Add Button
              Center(
                child: SizedBox(
                  height: 62,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                    onPressed: () => controller.addUnit(propertyId),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Add Unit",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
