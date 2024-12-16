import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Tanents/PreorityStatus.dart';
import 'package:private_property_management/Filters/Properties/PropertiesType.dart';
import 'package:private_property_management/Filters/Properties/location_filter.dart';
import 'package:private_property_management/Filters/Properties/number_of_units_filter.dart';
import 'package:private_property_management/Filters/Properties/status_filter.dart';
import 'MaintenanceDetailsScreens.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key, required tenantId});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  // Dummy maintenance requests data
  final List<Map<String, dynamic>> requests = [
    {
      "id": "120546",
      "tenantId": "20012024",
      "unitId": "1163213",
      "requestedDate": "20/01/2024",
      "priority": "High",
      "status": "Open",
      "resolvedDate": "",
    },
    {
      "id": "120547",
      "tenantId": "20012024",
      "unitId": "1163213",
      "requestedDate": "20/01/2024",
      "priority": "Medium",
      "status": "In Progress",
      "resolvedDate": "",
    },
    {
      "id": "120548",
      "tenantId": "20012024",
      "unitId": "1163213",
      "requestedDate": "",
      "priority": "Low",
      "status": "Resolved",
      "resolvedDate": "20/01/2024",
    },
  ];
  int selectedTabIndex = 0;
  final List<String> tabs = [
    "Priority Status",
    "Progress Status",
    "Assigned to",
    "Requested Date Range"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen(),
                    //   ),
                    // ),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "Maintenance      ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(height: 18),
              // Search Bar Row with Filter Button
              Row(
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
                            height: 2,
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
                    onTap: () {
                      _openFilterPopup(context, selectedTabIndex);
                    },
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
              const SizedBox(height: 12),
              // Tab Bar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTabIndex == index
                              ? const Color.fromRGBO(35, 79, 104, 1)
                              : const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: selectedTabIndex == index
                                ? Colors.white
                                : const Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),

              // Maintenance Request List
              Expanded(
                child: ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MaintenanceDetailsScreen(request: request),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Requested ID: ${request['id']}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(37, 43, 92, 1),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(37, 43, 92, 0.22),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: _buildStatusTag(request['priority'],
                                      Color.fromRGBO(37, 43, 92, 1)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tenant ID: ${request['tenantId']}",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(83, 88, 122, 1),
                                  ),
                                ),
                                Text(
                                  "Unit ID: ${request['unitId']}",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(83, 88, 122, 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            if (request['status'] == 'Resolved')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Resolved Date: ",
                                      style: const TextStyle(
                                        fontSize: 9.2,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(83, 88, 122, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: request['resolvedDate'],
                                          style: const TextStyle(
                                            fontSize: 9.2,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(83, 88, 122, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildStatusTag(
                                    request['status'],
                                    _getStatusColor(request['status']),
                                  ),
                                ],
                              )
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(
                                  //   "Requested Date: ${request['requestedDate']}",
                                  //   style:
                                  //       const TextStyle(color: Colors.black54),
                                  // ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Requested Date: ",
                                      style: const TextStyle(
                                        fontSize: 9.2,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(83, 88, 122, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: request['requestedDate'],
                                          style: const TextStyle(
                                            fontSize: 9.2,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(83, 88, 122, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildStatusTag(
                                    request['status'],
                                    _getStatusColor(request['status']),
                                  ),
                                ],
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
      ),
    );
  }

  Widget _buildStatusTag(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 9,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Open':
        return Color.fromRGBO(158, 0, 0, 1);
      case 'In Progress':
        return Color.fromRGBO(0, 21, 188, 1);
      case 'Resolved':
        return Color.fromRGBO(0, 158, 61, 1);
      default:
        return Color.fromRGBO(37, 43, 92, 1);
    }
  }

  void _openFilterPopup(BuildContext context, int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 0:
        showDialog(
          context: context,
          builder: (context) => const PropertyTypeFilter(),
        );
        break;
      case 1:
        showDialog(
          context: context,
          builder: (context) => const NumberOfUnitsFilter(),
        );
        break;
      case 2:
        showDialog(
          context: context,
          builder: (context) => const LocationFilter(),
        );
        break;
      case 3:
        showDialog(
          context: context,
          builder: (context) => const StatusFilter(),
        );
        break;
    }
  }
}
