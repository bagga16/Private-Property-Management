import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String userName;
  final String rent;
  final String status;
  final Color statusColor;
  final String unitName;
  final String updated;
  final String tenantStatus; // Dynamic tenant status from Firestore
  final bool showButtons;
  final int? daysRemaining;

  final VoidCallback onViewDetails;

  const PaymentCard({
    Key? key,
    required this.userName,
    required this.rent,
    required this.status,
    required this.statusColor,
    required this.unitName,
    required this.updated,
    required this.tenantStatus,
    required this.daysRemaining,
    this.showButtons = true,
    required this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // userName and Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF252B5C),
                    ),
                  ),
                  const SizedBox(width: 5),
                  if (tenantStatus.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(37, 43, 92, 0.22),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        "Former", // Dynamic tenant status
                        style: const TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF252B5C),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Text(
                    rent,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                  const Text(
                    "/month",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF252B5C),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Payment Status and unitName
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Payment Status",
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF53587A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status, // Dynamic status text
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),

          // unitName and Last Updated
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "unitName: Apt ${unitName}",
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(83, 88, 122, 1),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Updated: ',
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: updated,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),

          // Buttons (optional)
          if (showButtons)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF234F68),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onViewDetails,
                    child: const Text(
                      "View Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF234F68),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Send Reminder",
                        style: TextStyle(
                          color: Color(0xFF234F68),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
