import 'package:flutter/material.dart';

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

  // Current selected tab index
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
                      .map((payment) => _buildPaymentCard(payment))
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

  // Payment Card Widget
  Widget _buildPaymentCard(Map<String, dynamic> payment) {
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
          // Name and Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    payment['name'],
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
                    child: const Text(
                      "Former Tenant",
                      style: TextStyle(
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
                    payment['rent'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: payment['statusColor'],
                    ),
                  ),
                  Text(
                    "/month",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: payment['statusColor'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Payment Status and Unit
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
                  color: payment['statusColor'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  payment['status'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: payment['statusColor'],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Unit: Apart 101",
                style: TextStyle(
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
                    fontWeight:
                        FontWeight.w600, // Larger font size for "Created:"
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: payment['updated'],
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
          // Buttons
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
                  onPressed: () {},
                  child: const Text(
                    "View Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFF234F68),
                      )),
                  child: const Center(
                    child: Text(
                      "Send Reminder",
                      style: TextStyle(
                          color: Color(0xFF234F68),
                          fontSize: 14,
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
