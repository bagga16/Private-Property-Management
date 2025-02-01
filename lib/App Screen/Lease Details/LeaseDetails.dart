import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:private_property_management/Controllers/LeaseDetails/LeaseDetailsController.dart';
import 'package:private_property_management/Models/TenantModel.dart';
import 'package:private_property_management/Widgest/LeaseCard.dart';

class LeaseDetailsScreen extends StatelessWidget {
  final LeaseDetailsController _controller = Get.put(LeaseDetailsController());

  LeaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Lease Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF252B5C),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search Here",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            size: 22,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.filter_list),
                    ),
                  ),
                ],
              ),
            ),

            // Tab Bar
            Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: List.generate(
                      _controller.tabs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          _controller.selectedTabIndex.value = index;
                          _controller.fetchTenants(); // Reload tenants
                        },
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(right: 14),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          decoration: BoxDecoration(
                            color: _controller.selectedTabIndex.value == index
                                ? const Color(0xFF234F68)
                                : const Color.fromRGBO(245, 244, 248, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              _controller.tabs[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color:
                                    _controller.selectedTabIndex.value == index
                                        ? Colors.white
                                        : const Color(0xFF252B5C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 23),

            // Tenant List
            Expanded(
              child: Obx(() {
                if (_controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                final tenants = _controller.getFilteredTenants();

                if (tenants.isEmpty) {
                  return const Center(child: Text("No leases found."));
                }

                return RefreshIndicator(
                  onRefresh: _controller.fetchTenants,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: tenants.length,
                    itemBuilder: (context, index) {
                      final tenant = tenants[index];
                      return _buildTenantCard(tenant);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Build Tenant Card
  Widget _buildTenantCard(Tenant tenant) {
    final now = DateTime.now();
    DateTime leaseEnd;
    int daysRemaining;

    try {
      leaseEnd = DateFormat('dd/MM/yyyy').parse(tenant.leaseEnd.split(' ')[0]);
      daysRemaining = leaseEnd.difference(now).inDays;
    } catch (e) {
      print("Error parsing date for tenant ${tenant.name}: $e");
      leaseEnd = now;
      daysRemaining = 0;
    }

    return LeaseCard(
      name: tenant.name,
      rent: tenant.rentAmount,
      statusText: "Expire in $daysRemaining Days",
      statusColor: daysRemaining <= 7
          ? const Color(0xFFDF1525)
          : const Color(0xFF8BC83F),
      tenantId: tenant.id,
      unitId: tenant.unitId,
      paymentStatus: tenant.paymentStatus ?? "N/A",
      securityDeposit: tenant.securityDeposit ?? "N/A",
      tenantStatus: tenant.status,
    );
  }
}
