import 'package:flutter/material.dart';

class Assignedtofilter extends StatelessWidget {
  final Function(String) onApply;

  const Assignedtofilter({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    String selectedAssignedTo = "John";

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            "Assigned To",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(37, 43, 92, 1),
            ),
          ),
          const SizedBox(height: 12),

          // Dropdown Menu
          DropdownButtonFormField<String>(
            value: selectedAssignedTo,
            items: ["John", "Emma", "Bagga"]
                .map((person) => DropdownMenuItem(
                      value: person,
                      child: Text(person),
                    ))
                .toList(),
            onChanged: (value) {
              selectedAssignedTo = value!;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Apply Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                onApply(selectedAssignedTo);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(139, 200, 63, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Apply",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
