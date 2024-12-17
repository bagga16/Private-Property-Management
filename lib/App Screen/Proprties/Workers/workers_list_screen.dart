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
        id: 98721,
        name: "John Martin",
        role: "Admin",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        id: 34202,
        name: "John Martin",
        role: "Maintenance Worker",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        name: "John Martin",
        id: 11102,
        role: "Manager",
        email: "example@gmail.com",
        phone: "+1 321 2552 3321",
        createdDate: "20/01/2024",
        updatedDate: "20/01/2024",
      ),
      WorkerModel(
        id: 31102,
        name: "John Martin",
        role: "Admin",
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 22,
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
                          builder: (context) => const AddWorkerScreen(),
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
                  borderRadius: BorderRadius.circular(10),
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
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.fromLTRB(16, 15, 12, 15),
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(37, 43, 92, 1),
                                ),
                              ),
                              Text(
                                worker.role,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(139, 200, 63, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // Email Row
                          Row(
                            children: [
                              const Icon(Icons.email_rounded,
                                  size: 12,
                                  color: Color.fromRGBO(139, 200, 63, 1)),
                              const SizedBox(width: 8),
                              Text(
                                worker.email,
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
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
                                  size: 12,
                                  color: Color.fromRGBO(139, 200, 63, 1)),
                              const SizedBox(width: 8),
                              Text(
                                worker.phone,
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
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
                              RichText(
                                text: TextSpan(
                                  text: 'Created: ',
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(83, 88, 122, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: worker.createdDate,
                                      style: const TextStyle(
                                        fontSize: 9.4,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(83, 88, 122, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Updated: ',
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(83, 88, 122, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: worker.updatedDate,
                                      style: const TextStyle(
                                        fontSize: 9.4,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(83, 88, 122, 1),
                                      ),
                                    ),
                                  ],
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
