import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Proprties/Units/AddUnitScreen.dart';
import 'package:private_property_management/Models/UnitModel.dart';
import 'package:private_property_management/Widgest/UnitCard.dart';
import 'UnitDetailsScreen.dart';

class UnitsListScreen extends StatelessWidget {
  const UnitsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<UnitModel> units = [
      UnitModel(
        name: "Apartment 5C",
        unitId: "1163213",
        propertyId: "1163213",
        status: "Occupied",
        rentAmount: "\$235/",
        area: "150 sq. ft",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      UnitModel(
        name: "Apartment 5C",
        unitId: "1163213",
        propertyId: "1163213",
        status: "Vacant",
        rentAmount: "\$235/",
        area: "150 sq. ft",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      UnitModel(
        name: "Apartment 5C",
        unitId: "1163213",
        propertyId: "1163213",
        status: "Under Maintenance",
        rentAmount: "\$235/",
        area: "150 sq. ft",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
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
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
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
                      MaterialPageRoute(builder: (context) => AddUnitScreen()),
                    ),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Units List
              Expanded(
                child: ListView.builder(
                  itemCount: units.length,
                  itemBuilder: (context, index) {
                    return UnitCard(
                      unit: units[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UnitDetailsScreen(
                              unit: units[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
