import 'package:flutter/material.dart';
import 'package:private_property_management/Models/PropertyModel.dart';
import 'package:private_property_management/Widgest/PaymentCard.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final PropertyModel property;

  const PropertyDetailsScreen({super.key, required this.property});

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
                    "Property Details",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const AddPropertyScreen(),
                      //   ),
                      // );
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Image(
                          image: AssetImage('assets/icons/edditProfile.png')),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Entire Bromo Mountain View Cabin in Surabaya",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.location_on,
                      size: 17, color: Color.fromRGBO(139, 200, 63, 1)),
                  SizedBox(width: 2),
                  Text(
                    "Street, City, State, Zip Code, Country",
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This cabin comes with Smart Home System and beautiful viking style. You can see sunrise in the morning with City View from full Glass Window. This unit is surrounded by business district of West Surabaya that offers you the city life as well as wide range of culinary.\nThis apartment equipped with Washing Machine, Electric Stove, Microwave, Refrigerator, Cutlery.",
                style: TextStyle(
                  fontSize: 13.8,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(115, 115, 115, 1),
                ),
              ),
              const SizedBox(height: 16),
// Property Info Grid
              Container(
                child: Column(
                  children: [
                    _buildTwoColumnRow(
                      title1: "Property ID",
                      value1: property.id,
                      title2: "Property Type",
                      value2: property.type,
                    ),
                    const SizedBox(height: 22),
                    _buildTwoColumnRow(
                      title1: "No. of Units",
                      value1: property.units.toString(),
                      title2: "Status",
                      value2: property.status,
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Created: ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                            children: [
                              TextSpan(
                                text: property.createdDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Updated: ',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                            children: [
                              TextSpan(
                                text: property.updatedDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Payments Overview
              const Text(
                "Payments Overview",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 12),

              // Payment Cards
              PaymentCard(
                  name: "John Bagga",
                  rent: property.rent.toString(),
                  status: "Over Due (7 Days)",
                  statusColor: const Color.fromRGBO(223, 21, 37, 1),
                  isDue: true,
                  unit: "Appart ${property.units.toString()}",
                  updated: property.updatedDate),

              const SizedBox(height: 12),
              PaymentCard(
                  name: "John Bagga",
                  rent: property.rent.toString(),
                  status: "Due in (7 Days)",
                  statusColor: const Color.fromRGBO(139, 200, 63, 1),
                  isDue: true,
                  unit: "Appart ${property.units.toString()}",
                  updated: property.updatedDate),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // Two-column row for property info
  Widget _buildTwoColumnRow({
    required String title1,
    required String value1,
    required String title2,
    required String value2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildInfoItem(title1, value1),
        ),
        Expanded(
          child: _buildInfoItem(title2, value2),
        ),
      ],
    );
  }

  // Single info item
  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/point.png')),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(83, 88, 122, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ),
      ],
    );
  }
}
