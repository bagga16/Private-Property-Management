import 'package:flutter/material.dart';
import '../Models/UnitModel.dart';

class UnitCard extends StatelessWidget {
  final UnitModel unit;
  final VoidCallback onTap;

  const UnitCard({super.key, required this.unit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(016),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                unit.imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: unit.name,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                    children: [
                      TextSpan(
                        text: "  (ID:${unit.unitId})",
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      unit.rentAmount,
                      style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(139, 200, 63, 1)),
                    ),
                    const Text(
                      "month",
                      style: TextStyle(
                          fontSize: 6.5,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(139, 200, 63, 1)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Unit ID: ${unit.unitId}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                Text(
                  "Property ID: ${unit.propertyId}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  unit.area,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                Text(
                  unit.status,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: unit.status == "Occupied"
                          ? const Color.fromRGBO(158, 0, 0, 1)
                          : unit.status == "Vacant"
                              ? const Color.fromRGBO(0, 158, 61, 1)
                              : const Color.fromRGBO(0, 21, 188, 1)),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Created:  ",
                    style: const TextStyle(
                      fontSize: 9.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: unit.createdDate,
                        style: const TextStyle(
                          fontSize: 9.2,
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
                      fontSize: 9.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: unit.updatedDate,
                        style: const TextStyle(
                          fontSize: 9.2,
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
    );
  }
}
