import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/PropertyController.dart';
import 'package:private_property_management/Controllers/PropertyDetailsController.dart';
import 'package:private_property_management/Filters/Properties/PropertiesType.dart';
import 'package:private_property_management/Filters/Properties/number_of_units_filter.dart';
import 'package:private_property_management/Filters/Properties/status_filter.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Widgest/PropertyCard.dart';
import 'AddPropertyScreen.dart';

//controller.totalUnits.value.toString(),
class Propertiesscreen extends StatelessWidget {
  Propertiesscreen({super.key});
  final PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => HomeScreen()),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Properties",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Open AddPropertyScreen and refresh properties on return
                      await Get.to(() => AddPropertyScreen());
                      propertyController
                          .fetchProperties(); // Refresh properties
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar and Filter Button
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        onChanged: (query) {
                          propertyController.searchProperties(query);
                        },
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: "Search Here",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            size: 22,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
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
                        propertyController.tabs.length,
                        (index) => GestureDetector(
                          onTap: () {
                            propertyController.updateSelectedTabIndex(index);
                            if (index == 0) {
                              propertyController.resetFilters();
                            } else {
                              _openFilterDialog(context, index);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  propertyController.selectedTabIndex.value ==
                                          index
                                      ? const Color.fromRGBO(35, 79, 104, 1)
                                      : const Color.fromRGBO(245, 244, 248, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              propertyController.tabs[index],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color:
                                    propertyController.selectedTabIndex.value ==
                                            index
                                        ? Colors.white
                                        : const Color.fromRGBO(37, 43, 92, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),

              const SizedBox(height: 16),

              // Properties List
              Expanded(
                child: Obx(() {
                  if (propertyController.isLoading.value) {
                    return const Center(
                      child:
                          CircularProgressIndicator(), // Circular progress bar
                    );
                  }

                  if (propertyController.filteredProperties.isEmpty) {
                    return const Center(
                      child: Text(
                        "No properties found.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: propertyController.filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property =
                          propertyController.filteredProperties[index];
                      return PropertyCard(
                        property: property,
                        onTap: () {},
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openFilterDialog(BuildContext context, int index) {
    switch (index) {
      case 1: // Priority Status
        showDialog(
          context: context,
          builder: (context) => PropertyTypeFilter(
            onApply: (propertyType) {
              propertyController.applyPropertyTypeFilter(propertyType);
            },
          ),
        );
        break;
      case 2: // Progress Status
        showDialog(
          context: context,
          builder: (context) => PropertyStatusFilter(
            onApply: (status) {
              propertyController.applyPropertyStatusFilter(status);
            },
          ),
        );
        break;
      case 3: // Assigned To
        showDialog(
          context: context,
          builder: (context) => NumberOfUnitsFilter(
            onApply: (minUnits, maxUnits) {
              propertyController.applyUnitsFilter(minUnits, maxUnits);
            },
          ),
        );
        break;
      case 4: // Requested Date Range
        showDialog(
          context: context,
          builder: (context) => PropertyStatusFilter(
            onApply: (progressStatus) {
              propertyController.applyPropertyStatusFilter(progressStatus);
            },
          ),
        );
        break;
    }
  }
}
