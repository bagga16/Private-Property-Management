import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/MaintenanceController/MaintenanceController.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

class MaintenanceEditScreen extends StatelessWidget {
  final MaintenanceRequestModel request;
  final MaintenanceController controller = Get.find<MaintenanceController>();

  MaintenanceEditScreen({super.key, required this.request});

  final List<String> priorityOptions = ["High", "Medium", "Low"];
  final List<String> progressStatusOptions = [
    "Open",
    "In Progress",
    "Resolved",
  ];
  final List<String> assignedToOptions = ["John", "Emma", "Bagga"];

  final RxString selectedPriority = ''.obs;
  final RxString selectedProgressStatus = ''.obs;
  final RxString selectedAssignedTo = ''.obs;

  @override
  Widget build(BuildContext context) {
    // Initialize selected values
    selectedPriority.value = priorityOptions.contains(request.priority)
        ? request.priority
        : priorityOptions[0];
    selectedProgressStatus.value =
        progressStatusOptions.contains(request.status)
            ? request.status
            : progressStatusOptions[0];
    selectedAssignedTo.value = assignedToOptions.contains(request.assignedTo)
        ? request.assignedTo!
        : assignedToOptions[0];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
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
                      "Edit Maintenance",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const Text("        "),
                  ],
                ),
                const SizedBox(height: 12),

                // Image
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/maintenance.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 9),

                // Requested ID
                Text(
                  "Requested ID# ${request.id.substring(0, 6)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary. This apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF53587A),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Unit ID: ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                        children: [
                          TextSpan(
                            text: request.unitId,
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
                        text: 'Tenant ID: ',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                        children: [
                          TextSpan(
                            text: request.tenantId,
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

                const SizedBox(height: 12),
                // Priority Dropdown
                const Text(
                  "Priority Status",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Obx(() {
                  return Container(
                      height: 48,
                      child: DropdownButtonFormField<String>(
                        value: selectedPriority.value,
                        items: priorityOptions
                            .map((priority) => DropdownMenuItem<String>(
                                  value: priority,
                                  child: Text(priority),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            selectedPriority.value = value;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(245, 244, 248, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            fontWeight: FontWeight.w500),
                      ));
                }),
                const SizedBox(height: 12),

                // Progress Status Dropdown
                const Text(
                  "Progress Status",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Obx(() {
                  return Container(
                      height: 48,
                      child: DropdownButtonFormField<String>(
                        value: selectedProgressStatus.value,
                        items: progressStatusOptions
                            .map((status) => DropdownMenuItem<String>(
                                  value: status,
                                  child: Text(status),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            selectedProgressStatus.value = value;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(245, 244, 248, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            fontWeight: FontWeight.w500),
                      ));
                }),
                const SizedBox(height: 12),

                // Assigned To Dropdown
                const Text(
                  "Assigned To",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Obx(() {
                  return Container(
                      height: 48,
                      child: DropdownButtonFormField<String>(
                        value: selectedAssignedTo.value,
                        items: assignedToOptions
                            .map((assigned) => DropdownMenuItem<String>(
                                  value: assigned,
                                  child: Text(assigned),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            selectedAssignedTo.value = value;
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(245, 244, 248, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            fontWeight: FontWeight.w500),
                      ));
                }),
                const SizedBox(height: 24),

                // Update Button
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 96,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Prepare updated data
                        final updatedRequest = MaintenanceRequestModel(
                          id: request.id, // Ensure this is the document ID
                          tenantId: request.tenantId,
                          unitId: request.unitId,
                          requestedDate: request.requestedDate,
                          priority: selectedPriority.value,
                          status: selectedProgressStatus.value,
                          assignedTo: selectedAssignedTo.value,
                          resolvedDate: request.resolvedDate,
                        );

                        // Update Firestore
                        await controller
                            .updateMaintenanceRequest(updatedRequest);

                        // Navigate back to Maintenance Screen
                        Get.offAllNamed('/maintenance-screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Obx(() {
                        return controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 34),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
