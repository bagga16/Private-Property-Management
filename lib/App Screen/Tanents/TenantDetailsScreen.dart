import 'package:flutter/material.dart';

class TenantDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> tenant;

  const TenantDetailsScreen({super.key, required this.tenant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1),
                          size: 18,
                        ),
                      ),
                    ),
                    const Text(
                      "Tenant Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Tenant Name and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tenant["name"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    Text(
                      tenant["status"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(139, 200, 63, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Tenant Info
                _buildDetailRow(
                    Icons.person, "Tenant ID: ${tenant["tenantId"]}"),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.email, tenant["email"]),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.phone, tenant["phone"]),

                const SizedBox(height: 16),

                // Created & Updated Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailColumn("Created", tenant["createdDate"]),
                    _buildDetailColumn("Updated", tenant["updatedDate"]),
                  ],
                ),

                const SizedBox(height: 24),

                // Payment Info Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 244, 248, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Payment Info Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "John Martin",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                              const SizedBox(width: 6),
                              _buildStatusBadge("Former Tenant"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "\$235/month",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(223, 21, 37, 1),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(223, 21, 37, 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  "Over Due (7 Days)",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(223, 21, 37, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(35, 79, 104, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Extend Due Date",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                side: const BorderSide(
                                  color: Color.fromRGBO(35, 79, 104, 1),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Send Reminder",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(35, 79, 104, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Unit Details
                const Text(
                  "Unit Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                _buildDetailColumn("Unit ID", "5554112"),
                _buildDetailColumn("Unit Number", "Apart 101"),
                _buildDetailColumn("Rent Amount", "\$350.00"),

                const SizedBox(height: 16),

                // Lease Details
                const Text(
                  "Lease Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                _buildDetailColumn("Security Deposit", "\$350.00"),
                _buildDetailColumn("Payment Status", "Apart 101"),
                _buildDetailColumn("Lease Start", "20/01/2024"),
                _buildDetailColumn("Lease End", "20/01/2024"),

                const SizedBox(height: 16),

                // Lease Documents
                const Text(
                  "Lease Documents",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
                _buildDocumentRow("Diet Plan.pdf", "20/01/2024"),
                _buildDocumentRow("Diet Plan.pdf", "20/01/2024"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildDetailRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color.fromRGBO(139, 200, 63, 1)),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 241, 253, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(37, 43, 92, 1),
        ),
      ),
    );
  }

  Widget _buildDocumentRow(String name, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.picture_as_pdf,
                  color: Color.fromRGBO(223, 21, 37, 1), size: 20),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ],
      ),
    );
  }
}
