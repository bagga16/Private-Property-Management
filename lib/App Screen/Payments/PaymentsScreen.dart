// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:private_property_management/Controllers/PaymentsController/PaymentsController.dart';
// import 'package:private_property_management/Widgest/PaymentCard.dart';

// class PaymentsScreen extends StatelessWidget {
//   final PaymentsController _controller = Get.put(PaymentsController());

//   PaymentsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Get.back(),
//                     child: const CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Color.fromRGBO(245, 244, 248, 1),
//                       child: Icon(Icons.arrow_back_ios_new,
//                           color: Color.fromRGBO(37, 43, 92, 1), size: 16),
//                     ),
//                   ),
//                   const Spacer(),
//                   const Text(
//                     "Payments",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF252B5C),
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),

// // Search Bar
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//   child: Row(
//     children: [
//       Expanded(
//         child: Container(
//           height: 48,
//           decoration: BoxDecoration(
//             color: const Color.fromRGBO(245, 244, 248, 1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: const TextField(
//             textAlign: TextAlign.start,
//             textAlignVertical: TextAlignVertical.center,
//             decoration: InputDecoration(
//               hintText: "Search Here",
//               hintStyle: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: Color.fromRGBO(37, 43, 92, 1),
//               ),
//               border: InputBorder.none,
//               suffixIcon: Icon(
//                 Icons.search,
//                 color: Color.fromRGBO(37, 43, 92, 1),
//                 size: 22,
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 16),
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(width: 12),
//       GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 48,
//           width: 48,
//           decoration: BoxDecoration(
//             color: const Color.fromRGBO(245, 244, 248, 1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: const Icon(Icons.filter_list),
//         ),
//       ),
//     ],
//   ),
// ),

//             // Tab Bar
//             Obx(() {
//               return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Row(
//                     children: List.generate(
//                       _controller.tabs.length,
//                       (index) => GestureDetector(
//                         onTap: () => _controller.applyFilter(index),
//                         child: Container(
//                           height: 40,
//                           margin: const EdgeInsets.only(right: 14),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 0),
//                           decoration: BoxDecoration(
//                             color: _controller.selectedTabIndex.value == index
//                                 ? const Color(0xFF234F68)
//                                 : const Color.fromRGBO(245, 244, 248, 1),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Center(
//                             child: Text(
//                               _controller.tabs[index],
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 color:
//                                     _controller.selectedTabIndex.value == index
//                                         ? Colors.white
//                                         : const Color(0xFF252B5C),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),

//             const SizedBox(height: 23),

//             // Payment List
//             Expanded(
//               child: Obx(() {
//                 if (_controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (_controller.filteredPayments.isEmpty) {
//                   return const Center(child: Text("No payments available"));
//                 }

//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   itemCount: _controller.filteredPayments.length,
//                   itemBuilder: (context, index) {
//                     final payment = _controller.filteredPayments[index];
//                     return PaymentCard(
//                       name: payment['name'],
//                       rent: payment['rent'],
//                       status: payment['status'],
//                       statusColor: payment['statusColor'],
//                       daysRemaining: payment['daysRemaining'],
//                       unit: payment['unit'],
//                       updated: payment['updated'],
//                       showButtons: payment['statusType'] != 'paid',
//                       tenantStatus: payment['tenantStatus'],
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:private_property_management/Controllers/PaymentsController/PaymentsController.dart';
import 'package:private_property_management/Widgest/PaymentCard.dart';

class PaymentsScreen extends StatelessWidget {
  final PaymentsController _controller = Get.put(PaymentsController());

  PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Header**
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
                    "Payments",
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

            // **Tab Bar**
            Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: List.generate(
                      _controller.tabs.length,
                      (index) => GestureDetector(
                        onTap: () => _controller.applyFilter(index),
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

            const SizedBox(height: 20),

            // **Payment List**
            Expanded(
              child: Obx(() {
                if (_controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_controller.filteredPayments.isEmpty) {
                  return const Center(child: Text("No payments available"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: _controller.filteredPayments.length,
                  itemBuilder: (context, index) {
                    final payment = _controller.filteredPayments[index];
                    return PaymentCard(
                      userName: payment['userName'] ??
                          "Unknown User", // ✅ Show User Name
                      rent: "${payment['amount']}", // ✅ Show Amount
                      status: payment['status'],
                      statusColor: payment['status'] == "Paid"
                          ? Colors.green
                          : Colors.red,
                      unitName: payment['unitName'],
                      updated: payment['updatedDate'],
                      tenantStatus: payment['status'], // ✅ Dynamic Status
                      daysRemaining: null, // Not needed
                      showButtons: true,
                      onViewDetails: () =>
                          _showPaymentDetails(context, payment),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// **Bottom Sheet for Payment Details**
  void _showPaymentDetails(BuildContext context, Map<String, dynamic> payment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow full height
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Payment Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              _detailRow("User Name", payment['userName']),
              _detailRow("Unit Name", payment['unitName']),
              _detailRow("Amount Paid", "${payment['amount']}"),
              _detailRow("Payment Status", payment['status']),
              _detailRow("Due Date", payment['dueDate']),
              _detailRow("Updated Date", payment['updatedDate']),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF234F68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Close",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  /// **Helper Widget for Payment Details**
  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(value,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
