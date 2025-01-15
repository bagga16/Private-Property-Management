import 'package:flutter/material.dart';
import 'package:private_property_management/Widgest/PaymentCard.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  // Dummy payment data
  final List<Map<String, dynamic>> allPayments = [
    {
      "name": "John Martin",
      "rent": "\$235",
      "status": "Over Due (7 Days)",
      "statusColor": const Color(0xFFDF1525),
      "isDue": true,
      "unit": "Apart 101",
      "updated": "20/01/2024",
      "statusType": "overdue"
    },
    {
      "name": "John Martin",
      "rent": "\$235",
      "status": "Due in (7 Days)",
      "statusColor": const Color(0xFF8BC83F),
      "isDue": true,
      "unit": "Apart 101",
      "updated": "20/01/2024",
      "statusType": "due"
    },
    {
      "name": "John Martin",
      "rent": "\$235",
      "status": "Paid",
      "statusColor": const Color(0xFF8BC83F),
      "isDue": false,
      "unit": "Apart 101",
      "updated": "20/01/2024",
      "statusType": "paid"
    },
  ];

  int selectedTabIndex = 0;

  // Tabs list
  final List<String> tabs = [
    "All Payments",
    "Paid Payment",
    "Due Payments",
    "Date Range"
  ];

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
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 16),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Payments  ",
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
                        child: const Image(
                            image: AssetImage('assets/images/fliter.png'))),
                  ),
                ],
              ),
            ),

            // Tab Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(right: 14),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          color: selectedTabIndex == index
                              ? const Color(0xFF234F68)
                              : const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: selectedTabIndex == index
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
            ),

            const SizedBox(height: 23),

            // Payment List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: _getFilteredPayments()
                      .map(
                        (payment) => PaymentCard(
                          name: payment['name'],
                          rent: payment['rent'],
                          status: payment['status'],
                          statusColor: payment['statusColor'],
                          isDue: payment['isDue'],
                          unit: payment['unit'],
                          updated: payment['updated'],
                          showButtons: payment['statusType'] != 'paid',
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter payments based on the selected tab
  List<Map<String, dynamic>> _getFilteredPayments() {
    if (selectedTabIndex == 0) {
      return allPayments; // All Payments
    } else if (selectedTabIndex == 1) {
      return allPayments
          .where((payment) => payment['statusType'] == 'paid')
          .toList(); // Paid Payments
    } else {
      return allPayments
          .where((payment) =>
              payment['statusType'] == 'overdue' ||
              payment['statusType'] == 'due')
          .toList(); // Due Payments
    }
  }
}
