import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/UnitDetailsScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/AddUnitScreen.dart';
import 'package:private_property_management/Controllers/Units%20Controller/UnitController.dart';
import 'package:private_property_management/Widgest/UnitCard.dart';

class UnitsListScreen extends StatefulWidget {
  final String propertyId; // Relevant property ID

  UnitsListScreen({super.key, required this.propertyId});

  @override
  State<UnitsListScreen> createState() => _UnitsListScreenState();
}

class _UnitsListScreenState extends State<UnitsListScreen> {
  final UnitController controller = Get.put(UnitController());

  @override
  void initState() {
    super.initState();
    // Fetch units only once when the screen is initialized
    controller.fetchUnits(widget.propertyId);
  }

  @override
  Widget build(BuildContext context) {
    // Fetch only the units related to the specific property
    controller.fetchUnits(widget.propertyId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
// Header
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
                            "Units",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddUnitScreen(
                                  propertyId: widget.propertyId,
                                ),
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 22),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

// Search Bar
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Search Here",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(115, 115, 115, 1),
                            ),
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search,
                                color: Color.fromRGBO(37, 43, 92, 1), size: 22),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Units List
                      Expanded(
                        child: Obx(() => controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : ListView.builder(
                                itemCount: controller.units.length,
                                itemBuilder: (context, index) {
                                  final unit = controller.units[index];
                                  final unitId = unit.unitId;
                                  final propertyId = unit.propertyId;
                                  return UnitCard(
                                    unit: unit,
                                    onTap: () {
                                      Get.to(() => UnitDetailsScreen(
                                            unit: unit,
                                            propertyId: propertyId,
                                            unitId: unitId,
                                          ));
                                    },
                                  );
                                },
                              )),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
