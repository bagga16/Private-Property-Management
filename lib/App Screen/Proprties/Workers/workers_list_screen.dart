import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/Proprties/Workers/add_worker_screen.dart';
import 'package:private_property_management/App%20Screen/Proprties/Workers/worker_details_screen.dart';
import 'package:private_property_management/Models/WorkerModel.dart';

class WorkersListScreen extends StatelessWidget {
  const WorkersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of Workers
    List<WorkerModel> workers = [
      WorkerModel(
        name: "John Martin",
        role: "Admin",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        name: "John Martin",
        role: "Maintenance Worker",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        name: "John Martin",
        role: "Manager",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Workers",
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
                          builder: (context) => AddWorkerScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 24,
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
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(115, 115, 115, 1),
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

            // Workers List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to WorkerDetailsScreen with worker data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkerDetailsScreen(
                            worker: worker,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name and Role
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                worker.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                              Text(
                                worker.role,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(139, 200, 63, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Email Row
                          Row(
                            children: [
                              const Icon(Icons.email,
                                  size: 16,
                                  color: Color.fromRGBO(139, 200, 63, 1)),
                              const SizedBox(width: 8),
                              Text(
                                worker.email,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Phone Row
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  size: 16,
                                  color: Color.fromRGBO(139, 200, 63, 1)),
                              const SizedBox(width: 8),
                              Text(
                                worker.phone,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Created and Updated Dates
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Created: ${worker.createdDate}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
                              ),
                              Text(
                                "Updated: ${worker.updatedDate}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(83, 88, 122, 1),
                                ),
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
}
