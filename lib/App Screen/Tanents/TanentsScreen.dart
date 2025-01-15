import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Tanents/AddTenantScreen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TenantDetailsScreen.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Models/TenantModel.dart';

class TenantsScreen extends StatefulWidget {
  const TenantsScreen({super.key});

  @override
  State<TenantsScreen> createState() => _TenantsScreenState();
}

class _TenantsScreenState extends State<TenantsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Tenant> tenants = [
      Tenant(
        name: "John Martin",
        status: "Active",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        tenantId: "1163213",
        unitId: "1134534",
        leaseStart: "20/01/2024",
        leaseEnd: "20/01/2024",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
        rent: "\$235/",
      ),
      Tenant(
        name: "John Martin",
        status: "Former Tenant",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        tenantId: "1163213",
        unitId: "1134534",
        leaseStart: "20/01/2024",
        leaseEnd: "20/01/2024",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
        rent: "\$235/",
      ),
      Tenant(
        name: "John Martin",
        status: "Active",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        tenantId: "1163213",
        unitId: "1134534",
        leaseStart: "20/01/2024",
        leaseEnd: "20/01/2024",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
        rent: "\$235/",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            // Header Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                    ),
                  ),
                  const Text(
                    "Tenants",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTanentsScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 244, 248, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 2,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search,
                        color: Color.fromRGBO(37, 43, 92, 1), size: 22),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tenants List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: tenants.length,
                itemBuilder: (context, index) {
                  final tenant = tenants[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to TenantDetailsScreen and pass tenant data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TenantDetailsScreen(
                            tenant: {},
                          ),
                        ),
                      );
                    },
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
                                    tenant.rent,
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
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Color.fromRGBO(83, 88, 122, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
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
                                style: TextStyle(
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
                            leftValue: tenant.leaseStart,
                            rightTitle: "Lease End",
                            rightValue: tenant.leaseEnd,
                          ),
                          const SizedBox(height: 6),
                          _buildDetailsRow(
                            leftTitle: "Created",
                            leftValue: tenant.createdDate,
                            rightTitle: "Updated",
                            rightValue: tenant.updatedDate,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
