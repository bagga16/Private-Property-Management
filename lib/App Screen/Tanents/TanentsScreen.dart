import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:private_property_management/App%20Screen/Tanents/AddTenantScreen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TenantDetailsScreen.dart';
import 'package:private_property_management/Controllers/TenantsController.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Widgest/TenantCard.dart';

class TenantsScreen extends StatelessWidget {
  final TenantsController controller = Get.put(TenantsController());

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTanentsScreen(),
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
                                tenant: {},
                              ),
                            ),
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


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/App%20Screen/Tanents/AddTenantScreen.dart';
// import 'package:private_property_management/App%20Screen/Tanents/TenantDetailsScreen.dart';
// import 'package:private_property_management/Home.dart';
// import 'package:private_property_management/Models/TenantModel.dart';
// import 'package:private_property_management/Widgest/TenantCard.dart';

// class TenantsScreen extends StatefulWidget {
//   const TenantsScreen({super.key});

//   @override
//   State<TenantsScreen> createState() => _TenantsScreenState();
// }

// class _TenantsScreenState extends State<TenantsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final List<Tenant> tenants = [
//       Tenant(
//         name: "John Martin",
//         status: "Active",
//         email: "example@gmail.com",
//         phone: "+1 321 2552 3321",
//         tenantId: "1163213",
//         unitId: "1134534",
//         leaseStart: "20/01/2024",
//         leaseEnd: "20/01/2024",
//         createdDate: "20/01/2024",
//         updatedDate: "20/01/2024",
//         rent: "\$235/",
//       ),
//       Tenant(
//         name: "Jane Doe",
//         status: "Former Tenant",
//         email: "jane.doe@gmail.com",
//         phone: "+1 123 456 7890",
//         tenantId: "2233445",
//         unitId: "2233445",
//         leaseStart: "10/02/2023",
//         leaseEnd: "10/12/2023",
//         createdDate: "10/01/2023",
//         updatedDate: "10/12/2023",
//         rent: "\$300/",
//       ),
//       Tenant(
//         name: "Alice Smith",
//         status: "Active",
//         email: "alice.smith@gmail.com",
//         phone: "+1 987 654 3210",
//         tenantId: "4455667",
//         unitId: "4455667",
//         leaseStart: "01/03/2024",
//         leaseEnd: "01/03/2025",
//         createdDate: "01/03/2024",
//         updatedDate: "01/03/2024",
//         rent: "\$400/",
//       ),
//       Tenant(
//         name: "Alice Smith",
//         status: "Former",
//         email: "alice.smith@gmail.com",
//         phone: "+1 987 654 3210",
//         tenantId: "4455667",
//         unitId: "4455667",
//         leaseStart: "01/03/2024",
//         leaseEnd: "01/03/2025",
//         createdDate: "01/03/2024",
//         updatedDate: "01/03/2024",
//         rent: "\$400/",
//       ),
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 12),
//             // Header Row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Get.to(() => HomeScreen()),
//                     child: const CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                       child: Icon(Icons.arrow_back_ios_new,
//                           color: Color.fromRGBO(37, 43, 92, 1), size: 16),
//                     ),
//                   ),
//                   const Text(
//                     "Tenants",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const AddTanentsScreen(),
//                         ),
//                       );
//                     },
//                     child: const CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Color.fromRGBO(37, 43, 92, 1),
//                       child: Icon(Icons.add, color: Colors.white, size: 22),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Container(
//                 height: 48,
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(245, 244, 248, 1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search Here",
//                     hintStyle: TextStyle(
//                       fontSize: 12,
//                       height: 2,
//                       fontWeight: FontWeight.w500,
//                       color: Color.fromRGBO(37, 43, 92, 1),
//                     ),
//                     border: InputBorder.none,
//                     suffixIcon: Icon(Icons.search,
//                         color: Color.fromRGBO(37, 43, 92, 1), size: 22),
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Tenants List
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: tenants.length,
//                 itemBuilder: (context, index) {
//                   final tenant = tenants[index];
//                   return TenantCard(
//                     tenant: tenant,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TenantDetailsScreen(
//                             tenant: {},
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
