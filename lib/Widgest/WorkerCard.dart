import 'package:flutter/material.dart';
import 'package:private_property_management/Models/WorkerModel.dart';
import 'package:intl/intl.dart';

class WorkerCard extends StatelessWidget {
  final WorkerModel worker;
  final VoidCallback onTap;

  WorkerCard({required this.worker, required this.onTap});

  // Format date as DD/MM/YYYY
  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return date; // Return the raw value if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(16, 15, 12, 15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name and Role
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  worker.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                Text(
                  worker.role,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(139, 200, 63, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Email Row
            Row(
              children: [
                const Icon(Icons.email_rounded,
                    size: 12, color: Color.fromRGBO(139, 200, 63, 1)),
                const SizedBox(width: 8),
                Text(
                  worker.email,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Phone Row
            Row(
              children: [
                const Icon(Icons.phone,
                    size: 12, color: Color.fromRGBO(139, 200, 63, 1)),
                const SizedBox(width: 8),
                Text(
                  worker.phone,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Created and Updated Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Created Date: ',
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: formatDate(worker.createdDate),
                        style: const TextStyle(
                          fontSize: 9.4,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Updated Date: ',
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: worker.updatedDate.isNotEmpty
                            ? formatDate(worker.updatedDate)
                            : formatDate(worker.createdDate),
                        style: const TextStyle(
                          fontSize: 9.4,
                          fontWeight: FontWeight.w600,
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
