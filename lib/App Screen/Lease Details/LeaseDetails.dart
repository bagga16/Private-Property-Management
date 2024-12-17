import 'package:flutter/material.dart';

class LeaseDetailsScreen extends StatefulWidget {
  const LeaseDetailsScreen({super.key});

  @override
  State<LeaseDetailsScreen> createState() => _LeaseDetailsScreenState();
}

class _LeaseDetailsScreenState extends State<LeaseDetailsScreen> {
  // Dummy payment data
  final List<Map<String, dynamic>> allPayments = [
    {
      "name": "John Martin",
      "rent": "\$235",
      "status": "Expire in 7 days",
      "statusColor": const Color(0xFFDF1525),
      "isDue": true,
      "unitId": "21101",
      "securityDeposit": "\$120.00",
      "tenantId": "98421",
      "statusType": "overdue"
    },
    {
      "name": "Michel Panday",
      "rent": "\$235",
      "status": "Due in (7 Days)",
      "statusColor": const Color(0xFF8BC83F),
      "isDue": true,
      "unitId": "31101",
      "securityDeposit": "\$146.07",
      "tenantId": "98234",
      "statusType": "due"
    },
    {
      "name": "John Bagga",
      "rent": "\$235",
      "status": "Due in (21 Days)",
      "statusColor": const Color(0xFF8BC83F),
      "isDue": false,
      "unitId": "41101",
      "securityDeposit": "\$116.25",
      "tenantId": "8732",
      "statusType": "paid"
    },
  ];

  // Current selected tab index
  int selectedTabIndex = 0;

  // Tabs list
  final List<String> tabs = [
    "All Leases",
    "Expire in 7 Days",
    "Expire in 14 Days",
    "Expire in 21 Days"
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
      return allPayments;
    } else if (selectedTabIndex == 1) {
      return allPayments
          .where((payment) => payment['status'] == 'Expire in 7 days')
          .toList();
    } else if (selectedTabIndex == 2) {
      return allPayments
          .where((payment) =>
              payment['status'] == 'Expire in 14 days' ||
              payment['status'] == 'Due in (7 Days)')
          .toList();
    } else {
      return allPayments
          .where((payment) =>
              payment['status'] == 'Expire in 21 days' ||
              payment['status'] == 'Due in (21 Days)')
          .toList();
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
          const SizedBox(height: 4),
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
                      text: payment['tenantId'],
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
                    fontWeight:
                        FontWeight.w600, // Larger font size for "Created:"
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: payment['statusType'],
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
                      text: payment['unitId'],
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
                    fontWeight:
                        FontWeight.w600, // Larger font size for "Created:"
                    color: Color.fromRGBO(83, 88, 122, 1),
                  ),
                  children: [
                    TextSpan(
                      text: payment['securityDeposit'],
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
