import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Maintanance/Maintenance%20Filters/AssignedToFilter.dart';
import 'package:private_property_management/App%20Screen/Maintanance/Maintenance%20Filters/PriorityStatus.dart';
import 'package:private_property_management/App%20Screen/Maintanance/Maintenance%20Filters/ProgressStatusFilter.dart';
import 'package:private_property_management/App%20Screen/Maintanance/Maintenance%20Filters/RequestedDateRangeFilter.dart';
import 'package:private_property_management/App%20Screen/Maintanance/MaintenanceDetailsScreens.dart';
import 'package:private_property_management/Controllers/MaintenanceController/MaintenanceController.dart';
import 'package:private_property_management/Widgest/MaintenanceCard.dart';

class MaintenanceScreen extends StatelessWidget {
  final MaintenanceController controller = Get.put(MaintenanceController());

  @override
  Widget build(BuildContext context) {
    controller.fetchMaintenanceRequests(); // Fetch requests on screen load

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6.0),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Maintenance      ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 18),
                // Search Bar Row with Filter Button
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Search Here",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              height: 2,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(37, 43, 92, 1),
                              size: 22,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tab Bar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Row(
                        children: List.generate(
                          controller.tabs.length,
                          (index) => GestureDetector(
                            onTap: () {
                              controller.updateSelectedTabIndex(index);
                              if (index == 0) {
                                controller.clearFilters();
                              } else {
                                _openFilterDialog(context, index);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12),
                              decoration: BoxDecoration(
                                color: controller.selectedTabIndex.value ==
                                        index
                                    ? const Color.fromRGBO(35, 79, 104, 1)
                                    : const Color.fromRGBO(245, 244, 248, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.tabs[index],
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      controller.selectedTabIndex.value == index
                                          ? Colors.white
                                          : const Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),

                const SizedBox(height: 17),
                // Maintenance Request List
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.filteredRequests.length,
                    itemBuilder: (context, index) {
                      final request = controller.filteredRequests[index];

                      return MaintenanceCard(
                        request: request,
                        onTap: () {
                          // Debug to ensure the request data is correct
                          print(
                              "Navigating to details screen for: ${request.id}");

                          // Navigate to details screen
                          Get.to(
                              () => MaintenanceDetailsScreen(request: request));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _openFilterDialog(BuildContext context, int index) {
    switch (index) {
      case 1: // Priority Status
        showDialog(
          context: context,
          builder: (context) => PrioritystatusFilter(
            onApply: (priority) {
              controller.applyPriorityFilter(priority);
            },
          ),
        );
        break;
      case 2: // Progress Status
        showDialog(
          context: context,
          builder: (context) => Progressstatusfilter(
            onApply: (progressStatus) {
              controller.applyProgressFilter(progressStatus);
            },
          ),
        );
        break;
      case 3: // Assigned To
        showDialog(
          context: context,
          builder: (context) => Assignedtofilter(
            onApply: (assignedTo) {
              controller.applyAssignedToFilter(assignedTo);
            },
          ),
        );
        break;
      case 4: // Requested Date Range
        showDialog(
          context: context,
          builder: (context) => Requesteddaterangefilter(
            onApply: (from, to) {
              controller.applyDateRangeFilter(from, to);
            },
          ),
        );
        break;
    }
  }
}
