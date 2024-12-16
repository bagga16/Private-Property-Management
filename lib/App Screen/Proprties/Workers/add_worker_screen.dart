import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';
import 'package:private_property_management/Widgest/PropertyCard.dart';

class AddWorkerScreen extends StatefulWidget {
  const AddWorkerScreen({super.key});

  @override
  State<AddWorkerScreen> createState() => _AddWorkerScreenState();
}

class _AddWorkerScreenState extends State<AddWorkerScreen> {
  List<PropertyModel> properties = [
    PropertyModel(
      title: "Sky Dandelions",
      id: "1163213",
      address: "Street, City, State, Zip Code, Country",
      type: "Residential",
      units: 20,
      description:
          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
      createdDate: "20/01/2024",
      updatedDate: "20/01/2024",
      status: "Active",
    ),
    PropertyModel(
      title: "Blue Horizon",
      id: "1163214",
      address: "Street, City, State, Zip Code, Country",
      type: "Residential",
      units: 10,
      description:
          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
      createdDate: "20/01/2024",
      updatedDate: "20/01/2024",
      status: "Active",
    ),
  ];

  void _deleteProperty(int index) {
    setState(() {
      properties.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Column(
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
                            color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                      ),
                    ),
                    const Text(
                      "Add Worker",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const CustomTextField(height: 48, hintText: "Worker ID"),
                const SizedBox(height: 10),
                const CustomTextField(
                  height: 48,
                  hintText: "First Name",
                ),
                const SizedBox(height: 10),
                const CustomTextField(height: 48, hintText: "Last Name"),
                const SizedBox(height: 10),
                const CustomTextField(height: 48, hintText: "Email Address"),
                const SizedBox(height: 10),
                const CustomTextField(height: 48, hintText: "Phone Number"),
                const SizedBox(height: 10),
                const CustomTextField(height: 48, hintText: "Role"),
                const SizedBox(height: 28),
                const Row(
                  children: [
                    Text(
                      "Assign Properties",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Search Property To Assign",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: Color.fromRGBO(37, 43, 92, 1)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Property List with Delete Swipe
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return Dismissible(
                      key: Key(property.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(35, 79, 104, 1),
                        ),
                        child: const Icon(Icons.delete,
                            color: Colors.white, size: 32),
                      ),
                      onDismissed: (direction) {
                        _deleteProperty(index);
                      },
                      child: PropertyCard(property: property),
                    );
                  },
                ),

                const SizedBox(height: 92),

                // Add Button
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width - 96,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Add worker functionality
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 32), // Small spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
