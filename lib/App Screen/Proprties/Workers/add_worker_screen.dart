import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';
import 'package:private_property_management/Widgest/CustomTextField.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
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
            const CustomTextField(height: 48, hintText: "First Name"),
            const SizedBox(height: 10),
            const CustomTextField(height: 48, hintText: "Last Name"),
            const SizedBox(height: 10),
            const CustomTextField(height: 48, hintText: "Email Address"),
            const SizedBox(height: 10),
            const CustomTextField(height: 48, hintText: "Phone Number"),
            const SizedBox(height: 10),
            const CustomTextField(height: 48, hintText: "Role"),
            const SizedBox(height: 24),
            const Text(
              "Assign Properties",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        fontSize: 14,
                        color: Color.fromRGBO(115, 115, 115, 1),
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Color.fromRGBO(37, 43, 92, 1)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
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
                    child: Container(
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
                              const Text(
                                "Sky Dandelions",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(139, 200, 63, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Active",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "ID: 1163213  Street, City, State, Zip Code, Country",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(115, 115, 115, 1),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Residential  Units: 20",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(115, 115, 115, 1),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(115, 115, 115, 1),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Created: 20/01/2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(115, 115, 115, 1),
                                ),
                              ),
                              Text(
                                "Updated: 20/01/2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(115, 115, 115, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
