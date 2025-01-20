import 'package:flutter/material.dart';

class LeaseCard extends StatelessWidget {
  final String name;
  final String rent;
  final String statusText;
  final Color statusColor;
  final String tenantId;
  final String unitId;
  final String paymentStatus;
  final String securityDeposit;
  final String tenantStatus; // Add tenant status here

  const LeaseCard({
    Key? key,
    required this.name,
    required this.rent,
    required this.statusText,
    required this.statusColor,
    required this.tenantId,
    required this.unitId,
    required this.paymentStatus,
    required this.securityDeposit,
    required this.tenantStatus, // Add required for tenant status
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
          // Name and Rent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF252B5C),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 43, 92, 0.22),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      tenantStatus, // Use tenant status dynamically
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
                    "\$$rent",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                  Text(
                    "/month",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Status Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lease Expiration",
                style: TextStyle(
                  fontSize: 8.5,
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
                  statusText,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Tenant ID and Payment Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Tenant ID: ',
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: tenantId,
                      style: const TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Payment status: ',
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: paymentStatus,
                      style: const TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          // Unit ID and Security Deposit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Unit ID: ',
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: unitId,
                      style: const TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Security Deposit: ',
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: "\$$securityDeposit",
                      style: const TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
