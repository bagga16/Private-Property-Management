// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:private_property_management/Controllers/Units%20Controller/AddUnitController.dart';
// // import 'package:private_property_management/Widgest/CustomTextField.dart';

// // class AddUnitScreen extends StatelessWidget {
// //   final AddUnitController controller = Get.put(AddUnitController());

// //   final TextEditingController unitIdController = TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController rentAmountController = TextEditingController();
// //   final TextEditingController areaController = TextEditingController();
// //   final TextEditingController descriptionController = TextEditingController();

// //   final RxString unitType = ''.obs;
// //   final RxString availabilityStatus = ''.obs;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Obx(
// //         () => Padding(
// //           padding: const EdgeInsets.fromLTRB(24, 32, 24, 4),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const SizedBox(height: 14),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     GestureDetector(
// //                       onTap: () => Get.back(),
// //                       child: const CircleAvatar(
// //                         radius: 20,
// //                         backgroundColor: Color.fromRGBO(245, 244, 248, 1),
// //                         child: Icon(Icons.arrow_back_ios_new,
// //                             color: Color.fromRGBO(37, 43, 92, 1), size: 16),
// //                       ),
// //                     ),
// //                     const Text(
// //                       "Add Unit",
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.w700,
// //                         color: Color.fromRGBO(37, 43, 92, 1),
// //                       ),
// //                     ),
// //                     const Text('           ')
// //                   ],
// //                 ),
// //                 const SizedBox(height: 19),
// // GestureDetector(
// //   //  onTap: () => controller.pickImages(),
// //   child: Container(
// //     height: 150,
// //     width: double.infinity,
// //     decoration: BoxDecoration(
// //       color: const Color.fromRGBO(245, 244, 248, 1),
// //       borderRadius: BorderRadius.circular(12),
// //     ),
// //     child: const Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Icon(
// //           Icons.add_photo_alternate,
// //           size: 40,
// //           color: Color.fromRGBO(157, 178, 206, 1),
// //         ),
// //         SizedBox(height: 8),
// //         Text(
// //           "Add Image",
// //           style: TextStyle(
// //             fontSize: 12,
// //             fontWeight: FontWeight.w500,
// //             color: Color.fromRGBO(157, 178, 206, 1),
// //           ),
// //         ),
// //       ],
// //     ),
// //   ),
// // ),
// // const SizedBox(height: 10),
// // if (controller.selectedImages.isNotEmpty)
// //   SizedBox(
// //     height: 100,
// //     child: ListView.separated(
// //       scrollDirection: Axis.horizontal,
// //       itemCount: controller.selectedImages.length,
// //       itemBuilder: (context, index) {
// //         return ClipRRect(
// //           borderRadius: BorderRadius.circular(8),
// //           child: Image.file(
// //             controller.selectedImages[index],
// //             width: 100,
// //             height: 100,
// //             fit: BoxFit.cover,
// //           ),
// //         );
// //       },
// //       separatorBuilder: (context, index) =>
// //           const SizedBox(width: 12),
// //     ),
// //   ),
// //           const SizedBox(height: 30),
// //           CustomTextField(
// //             controller: unitIdController,
// //             hintText: "Unit ID",
// //             keyboardType: TextInputType.phone,
// //             height: 48,
// //             borderRadius: 10,
// //           ),
// //           const SizedBox(height: 10),
// //           CustomTextField(
// //             controller: nameController,
// //             height: 48,
// //             borderRadius: 10,
// //             hintText: "Unit Number / Name",
// //           ),
// //           const SizedBox(height: 10),
// //           Container(
// //             height: 48,
// //             child: DropdownButtonFormField<String>(
// //               onChanged: (value) => unitType.value = value ?? '',
// //               decoration: InputDecoration(
// //                 fillColor: const Color.fromRGBO(245, 244, 248, 1),
// //                 filled: true,
// //                 border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 hintText: "Unit Type",
// //               ),
// //               style: const TextStyle(
// //                 fontSize: 13,
// //                 color: Color.fromRGBO(37, 43, 92, 1),
// //                 fontWeight: FontWeight.w600,
// //               ),
// //               items: const [
// //                 DropdownMenuItem(value: "Office", child: Text("Office")),
// //                 DropdownMenuItem(value: "House", child: Text("House")),
// //                 DropdownMenuItem(
// //                     value: "Building", child: Text("Building")),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           CustomTextField(
// //             controller: areaController,
// //             height: 48,
// //             hintText: "Area",
// //           ),
// //           const SizedBox(height: 10),
// //           CustomTextField(
// //             controller: rentAmountController,
// //             height: 48,
// //             keyboardType: TextInputType.number,
// //             hintText: "Rent Amount",
// //           ),
// //           const SizedBox(height: 10),
// //           Container(
// //             height: 48,
// //             child: DropdownButtonFormField<String>(
// //               onChanged: (value) =>
// //                   availabilityStatus.value = value ?? '',
// //               decoration: InputDecoration(
// //                 fillColor: const Color.fromRGBO(245, 244, 248, 1),
// //                 filled: true,
// //                 border: OutlineInputBorder(
// //                   borderSide: BorderSide.none,
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 hintText: "Availability Status",
// //               ),
// //               style: const TextStyle(
// //                 fontSize: 13,
// //                 color: Color.fromRGBO(37, 43, 92, 1),
// //                 fontWeight: FontWeight.w600,
// //               ),
// //               items: const [
// //                 DropdownMenuItem(
// //                     value: "Occupied", child: Text("Occupied")),
// //                 DropdownMenuItem(value: "Vacant", child: Text("Vacant")),
// //                 DropdownMenuItem(
// //                     value: "Under Maintenance",
// //                     child: Text("Under Maintenance")),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           CustomTextField(
// //             controller: descriptionController,
// //             height: 156,
// //             maxLines: 6,
// //             hintText: "Description",
// //             focusBorderColor: Colors.transparent,
// //           ),
// //           const SizedBox(height: 100),
// //           Center(
// //             child: SizedBox(
// //               width: MediaQuery.of(context).size.width - 96,
// //               height: 60,
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   if (unitIdController.text.isEmpty ||
// //                       nameController.text.isEmpty ||
// //                       rentAmountController.text.isEmpty ||
// //                       areaController.text.isEmpty ||
// //                       unitType.value.isEmpty ||
// //                       availabilityStatus.value.isEmpty ||
// //                       descriptionController.text.isEmpty) {
// //                     Get.snackbar("Error", "All fields are required.");
// //                   } else {
// //                     controller.addUnit(
// //                       name: nameController.text,
// //                       unitId: unitIdController.text,
// //                       propertyId: "101",
// //                       status: availabilityStatus.value,
// //                       rentAmount: rentAmountController.text,
// //                       area: areaController.text,
// //                       description: descriptionController.text,
// //                     );
// //                   }
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //                 child: controller.isLoading.value
// //                     ? const CircularProgressIndicator(
// //                         color: Colors.white,
// //                       )
// //                     : const Text(
// //                         "Add",
// //                         style:
// //                             TextStyle(color: Colors.white, fontSize: 16),
// //                       ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 50),
// //         ],
// //       ),
// //     ),
// //   ),
// // ),
// //     );
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/Controllers/Units%20Controller/AddUnitController.dart';

// class AddUnitScreen extends StatelessWidget {
//   final String propertyId;
//   final AddUnitController controller = Get.put(AddUnitController());

//   AddUnitScreen({super.key, required this.propertyId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
// // Header
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     GestureDetector(
//       onTap: () => Get.back(),
//       child: const CircleAvatar(
//         radius: 22,
//         backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//         child: Icon(Icons.arrow_back_ios_new,
//             color: Color.fromRGBO(37, 43, 92, 1), size: 18),
//       ),
//     ),
//     const Text(
//       "Add Unit",
//       style: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w700,
//         color: Color.fromRGBO(37, 43, 92, 1),
//       ),
//     ),
//     const SizedBox(width: 48),
//   ],
// ),
//               const SizedBox(height: 20),

//               // Image Section
//               Obx(
// () => Container(
//   height: 160,
//   width: double.infinity,
//   decoration: BoxDecoration(
//     color: const Color.fromRGBO(245, 244, 248, 1),
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: controller.selectedImages.isEmpty
//       ? GestureDetector(
//           onTap: () => controller.pickImages(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.add_photo_alternate,
//                   size: 50,
//                   color: Color.fromRGBO(83, 88, 122, 1)),
//               SizedBox(height: 8),
//               Text(
//                 "Add Image",
// style: TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w500,
//   color: Color.fromRGBO(83, 88, 122, 1),
// ),
//               ),
//             ],
//           ),
//         )
//       : ListView(
//           scrollDirection: Axis.horizontal,
//           children: controller.selectedImages
//               .map(
//                 (image) => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.file(
//                       File(image.path),
//                       fit: BoxFit.cover,
//                       width: 120,
//                       height: 120,
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
// ),
//               ),
//               const SizedBox(height: 20),

//               // Input Fields
//               _buildTextField(
//                 controller: controller.unitNameController,
//                 hintText: "Unit ID",
//               ),
//               const SizedBox(height: 12),
//               _buildTextField(
//                 controller: controller.unitNameController,
//                 hintText: "Unit Number / Name",
//               ),
//               const SizedBox(height: 12),

//               // Dropdown for Unit Type
//               Obx(
//                 () => DropdownButtonFormField<String>(
//                   value: controller.selectedUnitType.value,
//                   items: controller.unitTypes.map((type) {
//                     return DropdownMenuItem(
//                       value: type,
//                       child: Text(
//                         type,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     controller.selectedUnitType.value = value!;
//                   },
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: const Color.fromRGBO(245, 244, 248, 1),
//                     hintText: "Unit Type",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               _buildTextField(
//                 controller: controller.areaController,
//                 hintText: "Area",
//               ),
//               const SizedBox(height: 12),
//               _buildTextField(
//                 controller: controller.rentAmountController,
//                 hintText: "Rent Amount",
//               ),
//               const SizedBox(height: 12),

//               // Dropdown for Availability Status
//               Obx(
//                 () => DropdownButtonFormField<String>(
//                   value: controller.selectedStatus.value,
//                   items: controller.statusOptions.map((status) {
//                     return DropdownMenuItem(
//                       value: status,
//                       child: Text(
//                         status,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromRGBO(83, 88, 122, 1),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     controller.selectedStatus.value = value!;
//                   },
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: const Color.fromRGBO(245, 244, 248, 1),
//                     hintText: "Availability Status",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               _buildTextField(
//                 controller: controller.descriptionController,
//                 hintText: "Enter Description",
//                 maxLines: 5,
//               ),
//               const SizedBox(height: 20),

//               // Add Button
//               Center(
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width - 96,
//                   height: 60,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       controller.addUnit(propertyId: propertyId);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text(
//                       "Add",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper Widget for Text Fields
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color.fromRGBO(245, 244, 248, 1),
//         hintText: hintText,
//         hintStyle: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromRGBO(83, 88, 122, 1),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 16,
//           horizontal: 16,
//         ),
//       ),
//     );
//   }
// }

//##############3

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
