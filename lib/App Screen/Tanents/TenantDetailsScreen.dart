import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Tanents/EditTenantScreen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TanentsScreen.dart';
import 'package:private_property_management/Controllers/TenantDetailsController.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class TenantDetailsScreen extends StatelessWidget {
  final String tenantDocId;
  final Map<String, dynamic> tenant;

  const TenantDetailsScreen({
    super.key,
    required this.tenantDocId,
    required this.tenant,
  });

  String getSafeString(dynamic value, [String defaultValue = "N/A"]) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return defaultValue;
    }
    return value.toString();
  }

  String formatDate(String date) {
    final dateTime = DateTime.parse(date);
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    final TenantDetailsController controller = Get.put(
      TenantDetailsController(tenantDocId),
      tag: tenantDocId,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => TenantsScreen()),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1),
                          size: 16,
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
                    GestureDetector(
                      onTap: () async {
                        // Fetch tenant details from Firestore
                        final docSnapshot = await FirebaseFirestore.instance
                            .collection('All Tenants')
                            .doc(tenantDocId)
                            .get();

                        if (docSnapshot.exists) {
                          // Convert Firestore data to Tenant object
                          final tenant = Tenant.fromMap(
                              docSnapshot.data()!, docSnapshot.id);

                          // Navigate to EditTenantScreen with Tenant object
                          Get.to(() => EditTenantScreen(tenant: tenant));
                        } else {
                          Get.snackbar("Error", "Tenant not found.");
                        }
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                        child: Image(
                          image: AssetImage('assets/icons/edditProfile.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),

                // Tenant Name and Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getSafeString(tenant["name"]),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(37, 43, 92, 1),
                      ),
                    ),
                    Text(
                      getSafeString(tenant["status"]),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tenant["status"] == "Active"
                            ? const Color.fromRGBO(139, 200, 63, 1)
                            : const Color.fromRGBO(223, 21, 37, 1),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                _buildDetailColumn(
                    "Tenant ID", getSafeString(tenant["tenantId"])),
                const SizedBox(height: 7),

                _buildDetailRow(Icons.email, getSafeString(tenant["email"])),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.phone, getSafeString(tenant["phone"])),

                const SizedBox(height: 22),

                // Created & Updated Date
                _buildDetailColumn("Created",
                    getSafeString(formatDate(tenant["createdDate"]))),
                _buildDetailColumn("Updated",
                    getSafeString(formatDate(tenant["updatedDate"]))),

                const SizedBox(height: 16),

                Obx(() {
                  if (controller.paymentDetails.isEmpty) {
                    return const SizedBox.shrink(); // ✅ Hide if no payments
                  }

                  return Column(
                    children: controller.paymentDetails.map((payment) {
                      return _buildPaymentCard(
                        name: tenant["name"] ?? "Unknown",
                        rent: "\$${payment["amount"]}/",
                        statusLabel: payment["paymentStatus"],
                        statusColor: payment["paymentStatus"] == "Paid"
                            ? const Color.fromRGBO(139, 200, 63, 1)
                            : const Color.fromRGBO(223, 21, 37, 1),
                        buttonText: "View Details",
                        isDue: payment["paymentStatus"] != "Paid",
                      );
                    }).toList(),
                  );
                }),

                const SizedBox(height: 16),

                // Unit Details
                const Text(
                  "Unit Details",
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                const SizedBox(height: 12),
                _buildDetailColumn("Unit ID", (tenant["unitId"])),
                _buildDetailColumn(
                  "Unit Number",
                  "${getSafeString(tenant["name"], "Apart 101")}",
                ),
                _buildDetailColumn(
                  "Rent Amount",
                  "\$${getSafeString(tenant["rentAmount"], "0")}",
                ),

                const SizedBox(height: 16),

                // Lease Details
                const Text(
                  "Lease Details",
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                const SizedBox(height: 12),

                _buildDetailColumn("Security Deposit",
                    getSafeString(tenant["securityDeposit"])),
                _buildDetailColumn(
                    "Payment Status", getSafeString(tenant["paymentStatus"])),
                const SizedBox(height: 8),
                _buildDetailColumn("Lease Start",
                    getSafeString(formatDate(tenant["leaseStart"]))),
                _buildDetailColumn(
                    "Lease End", getSafeString(formatDate(tenant["leaseEnd"]))),

                const SizedBox(height: 16),

                // Lease Documents Section
                const Text(
                  "Lease Documents",
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.leaseDocuments.isEmpty) {
                    return const Text(
                      "No documents found.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(83, 88, 122, 1),
                      ),
                    );
                  }

                  return Column(
                    children: controller.leaseDocuments.map((doc) {
                      return _buildDocumentRow(
                        doc["name"] ?? "Unknown Document",
                        (doc["uploadDate"] ?? "Unknown Date"),
                        doc["url"] ?? "",
                      );
                    }).toList(),
                  );
                }),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

////////////
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
            color: Color.fromRGBO(83, 88, 122, 1),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
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
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentRow(String name, String uploadDate, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.picture_as_pdf,
                  color: Color.fromRGBO(223, 21, 37, 1),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    name,
                    maxLines: 2, // Limit to 2 lines
                    overflow: TextOverflow
                        .ellipsis, // Add ellipsis if it exceeds 2 lines
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Add spacing between name and date
          Text(
            uploadDate,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(83, 88, 122, 1),
            ),
          ),
        ],
      ),
    );
  }

// Widget for Payment Card
  Widget _buildPaymentCard({
    required String name,
    required String rent,
    required String statusLabel,
    required Color statusColor,
    required String buttonText,
    required bool isDue,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Status
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
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 11,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3.4, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(37, 43, 92, 0.22),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Text(
                      "Former Tenant",
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(37, 43, 92, 1),
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
                  Text(
                    "month",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Status",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Unit: Apart 101",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      statusLabel,
                      style: TextStyle(
                        fontSize: 12,
                        color: statusColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Updated: 20/01/2024",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 88, 122, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 39,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(35, 79, 104, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Extend Due Date",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 39,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(35, 79, 104, 1),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      "Send Reminder",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(37, 43, 92, 1),
                          fontWeight: FontWeight.w500),
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
