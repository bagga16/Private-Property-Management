import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class TenantCard extends StatelessWidget {
  final Tenant tenant;
  final VoidCallback onTap;

  const TenantCard({
    Key? key,
    required this.tenant,
    required this.onTap,
  }) : super(key: key);
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.fromLTRB(16, 15, 12, 14),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name and Rent Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      tenant.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const SizedBox(width: 5),
                    _buildStatusBadge(tenant.status),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$${tenant.rent}/',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(139, 200, 63, 1),
                      ),
                    ),
                    const Text(
                      "month",
                      style: TextStyle(
                        fontSize: 6.5,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(139, 200, 63, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconRow(
                  Icons.email,
                  tenant.email,
                ),
                Text(
                  "TenantID: ${tenant.tenantId}",
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color.fromRGBO(83, 88, 122, 1),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconRow(
                  Icons.phone,
                  tenant.phone,
                ),
                Text(
                  "UnitID: ${tenant.unitId}",
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color.fromRGBO(83, 88, 122, 1),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            _buildDetailsRow(
              leftTitle: "Lease Start",
              leftValue: formatDate(tenant.leaseStart),
              rightTitle: "Lease End",
              rightValue: formatDate(tenant.leaseEnd),
            ),
            const SizedBox(height: 6),
            _buildDetailsRow(
              leftTitle: "Created",
              leftValue: formatDate(tenant.createdDate),
              rightTitle: "Updated",
              rightValue: formatDate(tenant.updatedDate),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Status Badge
  Widget _buildStatusBadge(String status) {
    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: status == "Active"
            ? const Color.fromRGBO(235, 255, 240, 1)
            : const Color.fromRGBO(37, 43, 92, 0.22),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: status == "Active"
                  ? const Color.fromRGBO(76, 175, 80, 1)
                  : const Color.fromRGBO(37, 43, 92, 1)),
        ),
      ),
    );
  }

  // Helper for Rows with Icons
  Widget _buildIconRow(
    IconData icon,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 12, color: const Color.fromRGBO(139, 200, 63, 1)),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(83, 88, 122, 1),
          ),
        ),
      ],
    );
  }

  // Helper for Lease and Date Rows
  Widget _buildDetailsRow({
    required String leftTitle,
    required String leftValue,
    required String rightTitle,
    required String rightValue,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDetailColumn(leftTitle, leftValue),
        _buildDetailColumn(rightTitle, rightValue),
      ],
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontSize: 9,
            color: Color.fromRGBO(83, 88, 122, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 9,
            color: Color.fromRGBO(83, 88, 122, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
