import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Models/PropertyModel.dart';

class Workerpropertycard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback? onDelete;
  final bool isSelected;
  const Workerpropertycard(
      {super.key,
      required this.property,
      this.onDelete,
      required this.isSelected});

  // Format date to DD/MM/YYYY
  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(139, 200, 63, 0.3)
              : const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Title and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                Container(
                  height: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: property.status == "Active"
                        ? const Color.fromRGBO(0, 158, 61, 1)
                        : const Color.fromRGBO(158, 0, 0, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    property.status,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Property ID and Address
            Row(
              children: [
                Text(
                  "ID: ${property.id.substring(0, 8)}", // First 8 characters
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Color.fromRGBO(139, 200, 63, 1),
                      ),
                      Flexible(
                        child: Text(
                          property.address,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(83, 88, 122, 1),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),

            // Property Type and Units
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${property.type}  ",
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  TextSpan(
                    text: "Units: ${property.units}",
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),

            // Property Description
            Text(
              property.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(83, 88, 122, 1),
              ),
            ),
            const SizedBox(height: 14),

            // Created and Updated Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Created: ",
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                      TextSpan(
                        text: formatDate(property.createdDate),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Updated: ",
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                      TextSpan(
                        text: formatDate(property.updatedDate),
                        style: const TextStyle(
                          fontSize: 9,
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
