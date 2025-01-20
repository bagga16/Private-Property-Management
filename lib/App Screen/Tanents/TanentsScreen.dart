import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/App%20Screen/Tanents/AddTenantScreen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TenantDetailsScreen.dart';
import 'package:private_property_management/Controllers/TenantsController.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Widgest/TenantCard.dart';

class TenantsScreen extends StatelessWidget {
  final TenantsController controller = Get.put(TenantsController());

  @override
  Widget build(BuildContext context) {
    // Reload tenants whenever the screen is opened
    controller.refreshTenants();

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
                    onTap: () => Get.to(() => HomeScreen()),
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
                    onTap: () async {
                      await Get.to(() => AddTanentsScreen());
                      // Refresh tenants after adding a new one
                      controller.refreshTenants();
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
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.tenants.isEmpty) {
                    return const Center(child: Text("No tenants available"));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.tenants.length,
                    itemBuilder: (context, index) {
                      final tenant = controller.tenants[index];
                      return TenantCard(
                        tenant: tenant,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TenantDetailsScreen(
                                      tenant: tenant.toMap(),
                                    )),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
