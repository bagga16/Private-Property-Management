import 'package:flutter/material.dart';
import 'package:private_property_management/Models/MaintenanceRequestModel.dart';

class MaintenanceCard extends StatelessWidget {
  final MaintenanceRequestModel request;
  final VoidCallback onTap;

  const MaintenanceCard(
      {super.key, required this.request, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.id.substring(0, 7),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 43, 92, 0.22),
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    request.priority,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tenant ID: ${request.tenantId}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                Text(
                  "Unit ID: ${request.unitId}",
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: request.status == 'Resolved'
                        ? "Resolved Date: " // Display "Resolved Date" if status is Resolved
                        : "Requested Date: ", // Otherwise display "Requested Date"
                    style: const TextStyle(
                      fontSize: 9.2,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                    children: [
                      TextSpan(
                        text: request.status == 'Resolved'
                            ? request.resolvedDate // Show Resolved Date
                            : request.requestedDate, // Show Requested Date
                        style: const TextStyle(
                          fontSize: 9.2,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(83, 88, 122, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  request.status,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: _getStatusColor(request.status),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Open':
        return const Color.fromRGBO(158, 0, 0, 1);
      case 'In Progress':
        return const Color.fromRGBO(0, 21, 188, 1);
      case 'Resolved':
        return const Color.fromRGBO(0, 158, 61, 1);
      default:
        return const Color.fromRGBO(37, 43, 92, 1);
    }
  }
}
