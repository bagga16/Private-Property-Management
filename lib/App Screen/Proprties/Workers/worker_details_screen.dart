import 'package:flutter/material.dart';

class WorkerDetailsScreen extends StatelessWidget {
  const WorkerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(37, 43, 92, 1)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Worker Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(37, 43, 92, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color.fromRGBO(37, 43, 92, 1)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Qwerty Jonathan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Worker ID: 5554112",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(115, 115, 115, 1),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.email, color: Color.fromRGBO(139, 200, 63, 1)),
                SizedBox(width: 8),
                Text(
                  "example@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.phone, color: Color.fromRGBO(139, 200, 63, 1)),
                SizedBox(width: 8),
                Text(
                  "+1 321 2552 3321",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(37, 43, 92, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Created: 20/01/2024",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(115, 115, 115, 1),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Updated: 20/01/2024",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(115, 115, 115, 1),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Assign Properties",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(37, 43, 92, 1),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 244, 248, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Search Property To Assign",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(115, 115, 115, 1),
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Color.fromRGBO(37, 43, 92, 1)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 255, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sky Dandelions",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(37, 43, 92, 1),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(139, 200, 63, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Active",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "ID: 1163213  Street, City, State, Zip Code, Country",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Residential  Units: 20",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo vulputate enim lobortis morbi.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Created: 20/01/2024",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(115, 115, 115, 1),
                              ),
                            ),
                            Text(
                              "Updated: 20/01/2024",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(115, 115, 115, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
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
