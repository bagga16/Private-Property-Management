import 'package:flutter/material.dart';

class MaintenanceEditScreen extends StatelessWidget {
  final Map<String, dynamic> request;

  const MaintenanceEditScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final TextEditingController priorityController =
        TextEditingController(text: request['priority']);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Maintenance",
          style: TextStyle(color: Color(0xFF252B5C)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF252B5C)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: priorityController,
              decoration: const InputDecoration(labelText: "Priority"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8BC83F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Handle Update Logic
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Update",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
