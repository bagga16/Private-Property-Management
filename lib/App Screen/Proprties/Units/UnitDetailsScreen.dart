import 'package:flutter/material.dart';
import 'package:private_property_management/Models/UnitModel.dart';

class UnitDetailsScreen extends StatefulWidget {
  final UnitModel unit;

  const UnitDetailsScreen({super.key, required this.unit});

  @override
  State<UnitDetailsScreen> createState() => _UnitDetailsScreenState();
}

class _UnitDetailsScreenState extends State<UnitDetailsScreen> {
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
                    "Unit Details",
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
                height: 35,
              ),
              Text(
                widget.unit.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
              const SizedBox(height: 16),

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
                      title1: "Unit ID",
                      value1: widget.unit.unitId,
                      title2: "Property ID",
                      value2: widget.unit.propertyId,
                    ),
                    const SizedBox(height: 29),
                    _buildTwoColumnRow(
                      title1: "Unit Type",
                      value1: "Office", //property.units.toString(),
                      title2: "Status",
                      value2: widget.unit.status,
                    ),
                    const SizedBox(height: 29),
                    _buildTwoColumnRow(
                      title1: "Area",
                      value1: widget.unit.area,
                      title2: "Rent Amount",
                      value2: widget.unit.rentAmount,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Created:  ",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                            children: [
                              TextSpan(
                                text: widget.unit.createdDate,
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
                            text: "Updated:  ",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(83, 88, 122, 1),
                            ),
                            children: [
                              TextSpan(
                                text: widget.unit.updatedDate,
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
