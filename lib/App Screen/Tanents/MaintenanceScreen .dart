import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Tanents/PreorityStatus.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Maintenance",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 244, 248, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search by Property, Requested Id",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Filter Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterTab(
                    context, "Priority Status", const PriorityStatusFilter()),
                _buildFilterTab(
                    context, "Progress Status", const PriorityStatusFilter()),
                _buildFilterTab(
                    context, "Assigned To", const PriorityStatusFilter()),
                _buildFilterTab(
                    context, "Date Range", const PriorityStatusFilter()),
              ],
            ),
            const SizedBox(height: 16),

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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Requested ID: ${request['id']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(37, 43, 92, 1),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Tenant ID: ${request['tenantId']}",
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 4),
                          if (request['status'] == 'Resolved')
                            Text(
                              "Resolved Date: ${request['resolvedDate']}",
                              style: const TextStyle(color: Colors.green),
                            )
                          else
                            Text(
                              "Requested Date: ${request['requestedDate']}",
                              style: const TextStyle(color: Colors.black54),
                            ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildStatusTag(
                                  request['priority'], Colors.orangeAccent),
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
    );
  }

  Widget _buildFilterTab(BuildContext context, String label, Widget screen) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => screen,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 244, 248, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Open':
        return Colors.red;
      case 'In Progress':
        return Colors.blue;
      case 'Resolved':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
