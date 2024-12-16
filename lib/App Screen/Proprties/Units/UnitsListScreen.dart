import 'package:flutter/material.dart';
import 'package:private_property_management/Models/UnitModel.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

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
        rentAmount: "\$235/month",
        area: "150 sq. ft",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      UnitModel(
        name: "Apartment 101",
        unitId: "1163214",
        propertyId: "1163213",
        status: "Vacant",
        rentAmount: "\$300/month",
        area: "200 sq. ft",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Units",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Navigate to Add Unit Screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(hintText: "Search Here"),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: units.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 255, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              units[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 43, 92, 1),
                              ),
                            ),
                            Text(
                              units[index].status,
                              style: TextStyle(
                                fontSize: 14,
                                color: units[index].status == "Occupied"
                                    ? Colors.red
                                    : const Color.fromRGBO(139, 200, 63, 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Unit ID: ${units[index].unitId}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(115, 115, 115, 1),
                                ),
                              ),
                            ),
                            Text(
                              units[index].rentAmount,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 43, 92, 1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Area: ${units[index].area}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Created: ${units[index].createdDate}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Updated: ${units[index].updatedDate}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
